# Install .NET Framework 4.8
$netFrameworkDownloadUrl = "https://download.microsoft.com/download/8/8/O/N/88O/ndp48-web.exe"
$netFrameworkInstallerPath = "$env:TEMP\ndp48-web.exe"
Invoke-WebRequest -Uri $netFrameworkDownloadUrl -OutFile $netFrameworkInstallerPath

# Install Chocolatey
$chocolateyDownloadUrl = "https://community.chocolatey.org/install.ps1"
Invoke-WebRequest -Uri $chocolateyDownloadUrl -OutFile "$env:TEMP\chocolatey-install.ps1"

# Start the Chocolatey installation script, but pass the `/norestart` parameter to prevent a reboot
Start-Process -FilePath "$env:TEMP\chocolatey-install.ps1" -ArgumentList "/norestart"

# Wait for the Chocolatey installation script to finish
Start-Sleep -Seconds 10

# Remove the temporary files
Remove-Item -Path $netFrameworkInstallerPath
Remove-Item -Path "$env:TEMP\chocolatey-install.ps1"
