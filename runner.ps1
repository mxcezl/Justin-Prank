Function Set-WallPaper($Value){
 Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
 rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

# GitHub Links
$githubUrl = "https://raw.githubusercontent.com/mxcezl/Justin-Hack-Windows/master"
$imagesUrl = "$githubUrl/images"

#Create dir if not exists
$imagesDir = "./images"
if(!(Test-Path $imagesDir)){
    New-Item -ItemType Directory -Path $imagesDir
}

# Get current dir
$dir = Get-Location
$dir = "$dir\images"

# Download images from $imagesUrl
$client = new-object System.Net.WebClient
$client.DownloadFile("$imagesUrl/justin.jpg", "$dir/justin.jpg")
$client.DownloadFile("$imagesUrl/selena.jpg", "$dir/selena.jpg")
$client.DownloadFile("$imagesUrl/justin_jesus.jpg", "$dir/justin_jesus.jpg")
$client.DownloadFile("$imagesUrl/justin_christmas.jpg", "$dir/justin_christmas.jpg")
$client.DownloadFile("$imagesUrl/justin_birthday.jpg", "$dir/justin_birthday.jpg")

# List images in images folder
$images = Get-ChildItem -Path .\images\ -Filter *.jpg

# TODO Add schedule task to change wallpaper every 10 minutes from the images in ./images
