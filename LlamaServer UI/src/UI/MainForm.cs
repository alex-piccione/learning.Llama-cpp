using System.Reflection;
using System.Text.Json;
using LlamaServerCore;

namespace LlamaServerUI;

public sealed class MainForm : Form
{
    private readonly ListBox _modelsList = new();
    private readonly Button _startButton = new() { Text = "Start", AutoSize = true };
    private readonly Button _stopButton = new() { Text = "Stop", AutoSize = true, Enabled = false };
    private readonly Button _configureButton = new() { Text = "\u2699 Configure", Width = 100, FlatStyle = FlatStyle.Standard };
    private readonly TextBox _logBox = new()
    {
        Multiline = true,
        ReadOnly = true,
        ScrollBars = ScrollBars.Vertical,
        Font = new Font(FontFamily.GenericMonospace, 9f),
    };

    // Warning label — shown when config is incomplete
    private readonly Label _warningLabel = new()
    {
        AutoSize = true,
        ForeColor = Color.DarkRed,
        Font = new Font(FontFamily.GenericSansSerif, 9f, FontStyle.Bold),
        Visible = false,
    };

    private readonly List<string> _modelIds = [];
    private readonly AppConfig _config;

    public MainForm()
    {
        Text = "Llama Server";
        ClientSize = new Size(900, 600);
        StartPosition = FormStartPosition.CenterScreen;
        MinimumSize = new Size(700, 450);
        Icon = LoadAppIcon();

        // Parent panel for all top content (deterministic stacking)
        var headerPanel = new Panel
        {
            Dock = DockStyle.Top,
            AutoSize = true,
            Padding = new Padding(0),
        };

        // Status bar (top of header)
        var statusBarRow = new FlowLayoutPanel
        {
            Height = 24,
            FlowDirection = System.Windows.Forms.FlowDirection.LeftToRight,
            Padding = new Padding(8, 0, 0, 0),
            BackColor = Color.LightGray,
        };
        statusBarRow.Controls.Add(_warningLabel);

        // Button row (below status)
        var buttonRow = new FlowLayoutPanel
        {
            Height = 32,
            FlowDirection = System.Windows.Forms.FlowDirection.LeftToRight,
            Padding = new Padding(8),
        };
        buttonRow.Controls.Add(_configureButton);
        buttonRow.Controls.Add(new Panel { Width = 4 });
        buttonRow.Controls.Add(_startButton);
        buttonRow.Controls.Add(new Panel { Width = 4 });
        buttonRow.Controls.Add(_stopButton);

        headerPanel.Controls.Add(statusBarRow);
        headerPanel.Controls.Add(buttonRow);

        // Main layout
        _modelsList.Dock = DockStyle.Fill;
        _modelsList.SelectionMode = SelectionMode.One;

        _logBox.Dock = DockStyle.Fill;

        var modelsSplitter = new Splitter { Dock = DockStyle.Bottom, Height = 5 };
        var logHost = new Panel { Dock = DockStyle.Bottom, Height = 200 };
        logHost.Controls.Add(_logBox);

        Controls.Add(modelsSplitter);
        Controls.Add(logHost);
        Controls.Add(headerPanel);
        Controls.Add(_modelsList);

        _configureButton.Click += OnConfigureClick;

        _config = AppConfig.Load(AppConfig.DefaultConfigPath);

        // Auto-discover llama-server.exe on first run.
        if (_config.LlamaBinsFolder.Length == 0)
        {
            DiscoverLlamaBins();
        }

        LoadModels();
    }

    private static Icon? LoadAppIcon()
    {
        try
        {
            using var stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("app.ico");
            return stream is null ? null : new Icon(stream);
        }
        catch (Exception ex) when (ex is IOException or InvalidCastException or ArgumentException)
        {
            return null;
        }
    }

    private void ShowError(string message)
    {
        _warningLabel.Text = "\u26A0 " + message;
        _warningLabel.ForeColor = Color.DarkRed;
        _warningLabel.Visible = true;
    }

    private void SetStatus(string text)
    {
        _warningLabel.Text = text;
        _warningLabel.ForeColor = Color.Black;
        _warningLabel.Visible = true;
    }

    private void ClearStatus() => _warningLabel.Visible = false;



    private void LoadModels()
    {
        try
        {
            var models = ModelsConfigLoader.Load(_config.ResolvedModelsConfigPath);
            foreach (var (id, model) in models)
            {
                _modelIds.Add(id);
                var exists = File.Exists(Path.Combine(_config.GgufFolder, model.File));
                _modelsList.Items.Add($"{id} {(exists ? "\uD83D\uDFE2" : "\uD83C\uDFA4")}");
            }

            if (_config.LastModelId.Length > 0)
            {
                var idx = _modelIds.IndexOf(_config.LastModelId);
                if (idx >= 0)
                    _modelsList.SelectedIndex = idx;
            }
            else if (_modelIds.Count > 0)
            {
                _modelsList.SelectedIndex = 0;
            }

            ClearStatus();
            SetStatus($"{_modelIds.Count} model(s) loaded");
        }
       catch (FileNotFoundException)
        {
            ShowError("The configuration of the app is not complete");
        }
       catch (JsonException ex)
        {
            ShowError("Invalid config.json — " + ex.Message);
        }
       catch (InvalidOperationException ex)
        {
            ShowError(ex.Message);
        }
       catch (Exception ex)
        {
            SetStatus($"Unexpected error: {ex.Message}");
        }
    }

    private string? SelectedModelId =>
        _modelsList.SelectedIndex >= 0 ? _modelIds[_modelsList.SelectedIndex] : null;

    private void AppendLog(string line) => _logBox.AppendText(line + Environment.NewLine);

    // --- Configuration dialog ---

    private void OnConfigureClick(object? sender, EventArgs e)
    {
        Visible = false;
        Application.Run(new ConfigurationForm(_config, () =>
        {
            Visible = true;
            LoadModels();
        }));
    }

    private void DiscoverLlamaBins()
    {
        var candidates = new[]
        {
            Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Programs", "llama-b*-bin-win-cuda*"),
            Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles), "llama-b*-bin-win-cuda*"),
            Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFilesX86), "llama-b*-bin-win-cuda*"),
        };

        foreach (var pattern in candidates)
        {
            try
            {
                var dir = Directory.GetParent(pattern);
                if (dir is null) continue;
                foreach (var match in dir.GetDirectories(Path.GetFileName(pattern)))
                {
                    var exe = Path.Combine(match.FullName, "llama-server.exe");
                    if (File.Exists(exe))
                    {
                        _config.LlamaBinsFolder = match.FullName;
                        _config.Save(AppConfig.DefaultConfigPath);
                        return;
                    }
                }
            }
            catch { /* skip unreadable dirs */ }
        }

        var pathDirs = Environment.GetEnvironmentVariable("PATH")?.Split(Path.PathSeparator) ?? Array.Empty<string>();
        foreach (var p in pathDirs)
        {
            var exe = Path.Combine(p, "llama-server.exe");
            if (File.Exists(exe))
            {
                _config.LlamaBinsFolder = p;
                _config.Save(AppConfig.DefaultConfigPath);
                return;
            }
        }

        ShowError("The configuration of the app is not complete");
        _startButton.Enabled = false;
    }

    // --- Server stubs ---

    private void OnStartClick(object? sender, EventArgs e)
    {
        var id = SelectedModelId;
        if (id is null)
        {
            SetStatus("No model selected");
            return;
        }
        SetStatus($"Starting {id}...");
        AppendLog($"[ui] start requested for '{id}' (logic pending)");
    }

    private void OnStopClick(object? sender, EventArgs e)
    {
        SetStatus("Stopped");
        AppendLog("[ui] stop requested (logic pending)");
    }
}
