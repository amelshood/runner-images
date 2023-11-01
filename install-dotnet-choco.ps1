# Set the path to the .NET Framework 4.8 installer
$netFrameworkInstallerPath = "C:\Temp\ndp48-x86-x64-allos-enu.exe"

# Download the .NET Framework 4.8 installer
(New-Object System.Net.WebClient).DownloadFile("https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe", $netFrameworkInstallerPath)

# Check if the .NET Framework 4.8 installer was downloaded successfully
if (-not (Test-Path $netFrameworkInstallerPath)) {
    Write-Host "Failed to download the .NET Framework 4.8 installer."
    Exit 1
}

# Set the path to the Chocolatey installer
$chocolateyInstallerPath = "C:\Temp\chocolatey.exe"

# Download the Chocolatey installer
(New-Object System.Net.WebClient).DownloadFile("https://chocolatey.org/install.ps1", $chocolateyInstallerPath)

# Check if the Chocolatey installer was downloaded successfully
if (-not (Test-Path $chocolateyInstallerPath)) {
    Write-Host "Failed to download the Chocolatey installer."
    Exit 1
}

# Install .NET Framework 4.8 without a reboot
Start-Process -FilePath $netFrameworkInstallerPath -ArgumentList "/q /norestart" -Wait

# Check if .NET Framework 4.8 was installed successfully
if (Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full -Name Version | Select-Object -ExpandProperty Version -eq "4.8.1") {
    Write-Host ".NET Framework 4.8 was installed successfully."
} else {
    Write-Host ".NET Framework 4.8 failed to install."
    Exit 1
}

# Install Chocolatey without a reboot
Start-Process -FilePath $chocolateyInstallerPath -ArgumentList "/InstallationType=PerMachine /InstallArgs=/noreboot" -Wait

# Check if Chocolatey was installed successfully
if (Get-Command -Name choco) {
    Write-Host "Chocolatey was installed successfully."
} else {
    Write-Host "Chocolatey failed to install."
    Exit 1
}
