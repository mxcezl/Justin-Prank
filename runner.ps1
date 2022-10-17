Function Set-WallPaper($Value){
 Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
 rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

# TODO Download images from GitHub

# List images in images folder
$images = Get-ChildItem -Path .\images\ -Filter *.jpg

# TODO Add schedule task to change wallpaper every 10 minutes from the images in ./images
