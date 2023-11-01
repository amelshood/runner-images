# Set the path to the .NET Framework 4.8 installer
$netFrameworkInstallerPath = "C:\Temp\ndp48-x86-x64-allos-enu.exe"

# Check if .NET Framework 4.8 is already installed
if (Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full -Name Version | Select-Object -ExpandProperty Version -eq "4.8.1") {
    Write-Host ".NET Framework 4.8 is already installed."
} else {
    # Install .NET Framework 4.8 without a reboot
    Start-Process -FilePath $netFrameworkInstallerPath -ArgumentList "/q /norestart" -Wait

    # Check if .NET Framework 4.8 was installed successfully
    if (Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full -Name Version | Select-Object -ExpandProperty Version -eq "4.8.1") {
        Write-Host ".NET Framework 4.8 was installed successfully."
    } else {
        Write-Host ".NET Framework 4.8 failed to install."
    }
}

# Install Chocolatey without a reboot
Start-Process -FilePath "C:\Temp\chocolatey.exe" -ArgumentList "/InstallationType=PerMachine /InstallArgs=/noreboot" -Wait

# Check if Chocolatey was installed successfully
if (Get-Command -Name choco) {
    Write-Host "Chocolatey was installed successfully."
} else {
    Write-Host "Chocolatey failed to install."
}
