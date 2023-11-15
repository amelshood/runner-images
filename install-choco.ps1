# Download the Chocolatey installation script
$installScriptURL = "https://community.chocolatey.org/install.ps1"
Invoke-WebRequest -Uri $installScriptURL -OutFile "$env:TEMP\installChocolatey.ps1"

# Execute the Chocolatey installation script
powershell -executionpolicy Bypass -File "$env:TEMP\installChocolatey.ps1"

# Remove downloaded script
Remove-Item "$env:TEMP\installChocolatey.ps1" -Force

# 2
# Import-Module 'C:\Chocolatey\Scripts\install.ps1'
# Install-Chocolatey -y

# 3. Create a new batch file named installChocolatey.cmd and add the following content:
# @echo off
# cd /temp
# powershell -ExecutionPolicy Bypass -Command "(New-Object System.Net.WebClient).DownloadFile('https://community.chocolatey.org/install.ps1', 'installChocolatey.ps1')"
# powershell -ExecutionPolicy Bypass -File '.\installChocolatey.ps1'
# set PATH=%PATH%;%ChocolateyInstall%\bin
# choco upgrade -y chocolatey

