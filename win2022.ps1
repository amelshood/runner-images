New-Item -Path "c:\" -Name "image" -ItemType "directory"
New-Item -Path "C:\hostedtoolcache\windows" -ItemType "directory"
New-Item -Path "C:\Program Files\WindowsPowerShell\Modules\" -ItemType "directory"
Copy-Item -Path "runner-images\images\win\scripts\Tests" -Destination "C:\image\Tests" -Recurse
Copy-Item -Path "runner-images\images\win\toolsets\toolset-2022.json" -Destination "C:\image\toolset.json"
Copy-Item -Path "runner-images\images\win\windows2022.json" -Destination "C:\imagedata.json"

IMAGE_VERSION=dev
IMAGE_OS=win22
IMAGEDATA_FILE="C:\imagedata.json"
HELPER_SCRIPT_FOLDER="C:\Program Files\WindowsPowerShell\Modules\"
AGENT_TOOLSDIRECTORY="C:\hostedtoolcache\windows"
IMAGE_FOLDER="C:\image"


$Env:IMAGE_VERSION
$Env:IMAGE_OS
$Env:IMAGEDATA_FILE
$Env:HELPER_SCRIPT_FOLDER
$Env:AGENT_TOOLSDIRECTORY
$Env:IMAGE_FOLDER

Import-Module .\runner-images\images\win\scripts\ImageHelpers\ImageHelpers.psm1

