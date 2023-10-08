$url = "https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&channel=Release&version=VS2022&source=VSLandingPage&cid=2030&passive=false"
New-Item -Path 'C:\dev\pub\vs' -ItemType Directory -force

$downloadPath = "C:\dev\pub\vs"
$filePath = "C:\dev\pub\vs\vs_professional.exe"
Invoke-WebRequest -URI $url -OutFile $filePath

$workloadArgument = @(
   
    '--add Microsoft.Net.Component.4.7.1.SDK'

    '--add Microsoft.VisualStudio.Component.Windows10SDK.17134'

    '--add Microsoft.Net.Component.4.7.1.TargetingPack'
) 

$optionsAddLayout          = [string]::Join(" ", $workloadArgument )
$optionsQuiet              = "--quiet"
$optionsLayout             = "--layout $downloadPath"
$optionsIncludeRecommended = "--includeRecommended"

$vsOptions = @(
    $optionsLayout,
    $optionsIncludeRecommended,
    $optionsAddLayout
    $optionsQuiet
)

Start-Process -FilePath $filePath -ArgumentList $vsOptions