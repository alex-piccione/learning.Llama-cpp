using LlamaServerCore;

namespace LlamaServerUI;

/// <summary>Standalone configuration form that replaces the main window.</summary>
public sealed class ConfigurationForm : Form
{
    private readonly AppConfig _config;
    private readonly Action _onRestored;
    private readonly TextBox _txtBins = new();
    private readonly Button _btnBrowseBins = new() { Text = "Browse", Width = 70 };
    private readonly TextBox _txtGguf = new();
    private readonly Button _btnBrowseGguf = new() { Text = "Browse", Width = 70 };
    private readonly NumericUpDown _numPort = new() { Minimum = 1, Maximum = 65535, Value = 8001 };
    private readonly TextBox _txtYaml = new();
    private readonly Button _btnBrowseYaml = new() { Text = "Browse", Width = 70 };
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
        ClientSize = new Size(520, 240);

        // Title
        var lblTitle = new Label
        {
            Text = "Configuration",
            Font = new Font(FontFamily.GenericSansSerif, 11f, FontStyle.Bold),
            Location = new Point(16, 12),
            AutoSize = true,
        };

        // Row helpers
        TableLayoutPanel MakeRow(string label, TextBox target, bool isFile)
        {
            var row = new TableLayoutPanel
            {
                ColumnCount = 4,
                RowCount = 1,
                AutoSize = true,
                Margin = new Padding(0, 6, 0, 6),
            };
            row.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 120));
            row.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100f));
            row.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 10));
            row.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 70));

            var lblC = new Label { Text = label, AutoSize = true };
            var spacer = new Panel();
            var browseBtn = new Button { Text = "Browse", Width = 70 };
            browseBtn.Click += (_, _) =>
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

            row.Controls.Add(lblC, 0, 0);
            row.Controls.Add(target, 1, 0);
            row.Controls.Add(spacer, 2, 0);
            row.Controls.Add(browseBtn, 3, 0);
            return row;
        }

        var r1 = MakeRow("llama.cpp bin:", _txtBins, false);
        var r2 = MakeRow("GGUF folder:", _txtGguf, false);
        var r3 = new TableLayoutPanel
        {
            ColumnCount = 4,
            RowCount = 1,
            AutoSize = true,
            Margin = new Padding(0, 6, 0, 6),
        };
        r3.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 120));
        r3.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100f));
        r3.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 10));
        r3.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 70));
        r3.Controls.Add(new Label { Text = "Port:", AutoSize = true }, 0, 0);
        r3.Controls.Add(_numPort, 1, 0);

        var r4 = MakeRow("Models config:", _txtYaml, true);

        // Buttons
        var btnPanel = new FlowLayoutPanel
        {
            FlowDirection = System.Windows.Forms.FlowDirection.LeftToRight,
            Location = new Point(16, ClientSize.Height - 50),
            AutoSize = true,
        };
        btnPanel.Controls.Add(_btnSave);
        btnPanel.Controls.Add(new Panel { Width = 8 });
        btnPanel.Controls.Add(_btnCancel);

        Controls.Add(lblTitle);
        Controls.Add(r1);
        Controls.Add(r2);
        Controls.Add(r3);
        Controls.Add(r4);
        Controls.Add(btnPanel);

        // Populate from config
        _txtBins.Text = _config.LlamaBinsFolder;
        _txtGguf.Text = _config.GgufFolder;
        _numPort.Value = _config.Port;
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
