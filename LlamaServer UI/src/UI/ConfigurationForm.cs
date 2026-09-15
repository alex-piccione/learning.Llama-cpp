using LlamaServerCore;

namespace LlamaServerUI;

/// <summary>Standalone configuration dialog for editing config.json values.</summary>
public sealed class ConfigurationForm : Form
{
    private readonly AppConfig _config;
    private readonly Action _onRestored;
    private readonly TextBox _txtBins = new();
    private readonly TextBox _txtGguf = new();
    private readonly NumericUpDown _numPort = new() { Minimum = 1, Maximum = 65535, Value = 8001 };
    private readonly TextBox _txtYaml = new();
    private readonly Button _btnSave = new() { Text = "Save", Width = 80 };
    private readonly Button _btnCancel = new() { Text = "Cancel", Width = 80 };

    public ConfigurationForm(AppConfig config, Action onRestored)
    {
        _config = config;
        _onRestored = onRestored;
        Text = "Configuration";
        StartPosition = FormStartPosition.CenterScreen;
        FormBorderStyle = FormBorderStyle.FixedDialog;
        ShowInTaskbar = false;
        MaximizeBox = false;
        MinimizeBox = false;
        ClientSize = new Size(520, 250);

        var lblTitle = new Label
        {
            Text = "Configuration",
            Font = new Font(FontFamily.GenericSansSerif, 11f, FontStyle.Bold),
            AutoSize = true,
            Dock = DockStyle.Top,
            Padding = new Padding(0, 0, 0, 8),
        };

        // Grid with columns: [label 120] [value 100%] [spacer 10] [browse 70]
        var grid = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 4,
            RowCount = 6,
            Padding = new Padding(16, 4, 16, 8),
        };
        for (var c = 0; c < grid.ColumnCount; c++)
        {
            grid.ColumnStyles.Add(c == 0
                ? new ColumnStyle(SizeType.Absolute, 120)
                : c == 2
                    ? new ColumnStyle(SizeType.Absolute, 10)
                    : c == 3
                        ? new ColumnStyle(SizeType.Absolute, 70)
                        : new ColumnStyle(SizeType.Percent, 100f));
        }
        for (var r = 0; r < grid.RowCount; r++)
            grid.RowStyles.Add(new RowStyle(SizeType.Absolute, 34));

        Label MakeLabel(string text) => new() { Text = text, AutoSize = true, Anchor = AnchorStyles.Left };
        Button MakeBrowse(TextBox target, bool isFile)
        {
            var btn = new Button { Text = "Browse", Width = 70 };
            btn.Click += (_, _) =>
            {
                if (isFile)
                {
                    using var ofd = new OpenFileDialog { Filter = "YAML files|*.yaml;*.yml" };
                    if (ofd.ShowDialog(this) == DialogResult.OK)
                        target.Text = ofd.FileName;
                }
                else
                {
                    using var fbd = new FolderBrowserDialog();
                    if (fbd.ShowDialog(this) == DialogResult.OK)
                        target.Text = fbd.SelectedPath;
                }
            };
            return btn;
        }

        _txtBins.Anchor = _txtGguf.Anchor = _txtYaml.Anchor = AnchorStyles.Left | AnchorStyles.Right;
        _numPort.Anchor = AnchorStyles.Left;

        grid.Controls.Add(MakeLabel("llama.cpp bin:"), 0, 0);
        grid.Controls.Add(_txtBins, 1, 0);
        grid.Controls.Add(MakeBrowse(_txtBins, isFile: false), 3, 0);

        grid.Controls.Add(MakeLabel("GGUF folder:"), 0, 1);
        grid.Controls.Add(_txtGguf, 1, 1);
        grid.Controls.Add(MakeBrowse(_txtGguf, isFile: false), 3, 1);

        grid.Controls.Add(MakeLabel("Port:"), 0, 2);
        grid.Controls.Add(_numPort, 1, 2);

        grid.Controls.Add(MakeLabel("Models config:"), 0, 3);
        grid.Controls.Add(_txtYaml, 1, 3);
        grid.Controls.Add(MakeBrowse(_txtYaml, isFile: true), 3, 3);

        var btnPanel = new FlowLayoutPanel
        {
            FlowDirection = FlowDirection.LeftToRight,
            AutoSize = true,
            Anchor = AnchorStyles.Left,
            Margin = new Padding(0, 8, 0, 0),
        };
        btnPanel.Controls.Add(_btnSave);
        btnPanel.Controls.Add(new Panel { Width = 8, Height = 1 });
        btnPanel.Controls.Add(_btnCancel);
        grid.SetColumnSpan(btnPanel, 4);
        grid.Controls.Add(btnPanel, 0, 4);

        Controls.Add(grid);
        Controls.Add(lblTitle);

        // Populate from config
        _txtBins.Text = _config.LlamaBinsFolder;
        _txtGguf.Text = _config.GgufFolder;
        _numPort.Value = Math.Clamp(_config.Port, 1, 65535);
        _txtYaml.Text = _config.ModelsConfigPath;

        _btnSave.Click += OnSaveClick;
        _btnCancel.Click += (_, _) => Close();
    }

    private void OnSaveClick(object? sender, EventArgs e)
    {
        _config.LlamaBinsFolder = _txtBins.Text.Trim();
        _config.GgufFolder = _txtGguf.Text.Trim();
        _config.Port = (int)_numPort.Value;
        _config.ModelsConfigPath = _txtYaml.Text.Trim();
        _config.Save(AppConfig.DefaultConfigPath);
        _onRestored();
        Close();
    }
}