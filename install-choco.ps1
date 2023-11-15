# Download the Chocolatey installation script
$installScriptURL = "https://community.chocolatey.org/install.ps1"
Invoke-WebRequest -Uri $installScriptURL -OutFile "$env:TEMP\installChocolatey.ps1"

# Execute the Chocolatey installation script
powershell -executionpolicy Bypass -File "$env:TEMP\installChocolatey.ps1"

# Remove downloaded script
Remove-Item "$env:TEMP\installChocolatey.ps1" -Force
