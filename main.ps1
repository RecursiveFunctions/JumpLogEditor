Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Jump Log Editor"
$form.Size = New-Object System.Drawing.Size(800,600)
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
#Create Tab Control
$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Dock = [System.Windows.Forms.DockStyle]::Fill

# Create TabPages
$tabPage1 = New-Object System.Windows.Forms.TabPage
$tabPage2 = New-Object System.Windows.Forms.TabPage

$tabControl.TabPages.Add($tabPage1)
$tabControl.TabPages.Add($tabPage2)

#TEXT BOXES
#line no.
$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Location = New-Object System.Drawing.Point(50, 50)
$textBox1.Size = New-Object System.Drawing.Size(30, 20)

#Place of jump
$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Location = New-Object System.Drawing.Point(100, 50)
$textBox2.Size = New-Object System.Drawing.Size(100, 20)

#Type of Duty
$textBox3 = New-Object System.Windows.Forms.TextBox
$textBox3.Location = New-Object System.Drawing.Point(180, 50)
$textBox3.Size = New-Object System.Drawing.Size(80, 20)

#Type of Jump
$textBox4 = New-Object System.Windows.Forms.TextBox
$textBox4.Location = New-Object System.Drawing.Point(200, 50)
$textBox4.Size = New-Object System.Drawing.Size(80, 20)

#Type of Parachute
$textBox5 = New-Object System.Windows.Forms.TextBox
$textBox5.Location = New-Object System.Drawing.Point(250, 50)
$textBox5.Size = New-Object System.Drawing.Size(60, 20)

$label1 = New-Object System.Windows.Forms.Label
$label1.Text = "Line No."
$label1.Location = New-Object System.Drawing.Point(50, 30)
$tabPage1.Controls.Add($label1)

$label2 = New-Object System.Windows.Forms.Label
$label2.Text = "Place of Jump"
$label2.Location = New-Object System.Drawing.Point(150, 30)
$tabPage1.Controls.Add($label2)

$label3 = New-Object System.Windows.Forms.Label
$label3.Text = "Type of Duty"
$label3.Location = New-Object System.Drawing.Point(250, 30)
$tabPage1.Controls.Add($label3)

$label4 = New-Object System.Windows.Forms.Label
$label4.Text = "Type of Parachute"
$label4.Location = New-Object System.Drawing.Point(350, 30)
$tabPage1.Controls.Add($label4)

$buttonJ = New-Object System.Windows.Forms.Button
$buttonJ.Location = New-Object System.Drawing.Point(150, 120)
$buttonJ.Size = New-Object System.Drawing.Size(100,30)
$buttonJ.Text = "Select File"
$buttonJ.DialogResult = [System.Windows.Forms.DialogResult]::OK

$buttonJ = New-Object System.Windows.Forms.Button
$buttonJ.Location = New-Object System.Drawing.Point(150, 120)
$buttonJ.Size = New-Object System.Drawing.Size(100,30)
$buttonJ.Text = "Select File"
$buttonJ.DialogResult = [System.Windows.Forms.DialogResult]::OK

$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.Filter = "Excel Files (*.xlsx)|*.XLSX|CSV Files (*.csv)|*.CSV|Text files (*.txt)|*.TXT|PDF Files (*.pdf)|*.pdf | All files (*.*)|*.*"
$openFileDialog.Title = "Select a file"
$openFileDialog.InitialDirectory = [Environment]::GetFolderPath('MyDocuments')

$buttonJ.Add_Click({
    $result = $openFileDialog.ShowDialog()
    if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
        $file = $openFileDialog.FileName
        Write-Host "Selected file: $file"
    }
})

$tabPage1.Controls.Add($textBox1)
$tabPage1.Controls.Add($textBox2)
$tabPage1.Controls.Add($textBox3)
$tabPage1.Controls.Add($buttonJ)

# Add TabControl to form
$form.Controls.Add($tabControl)

[void]$form.ShowDialog()
