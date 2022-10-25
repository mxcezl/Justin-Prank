# Get images directory
$jhPath = "$env:userprofile\jh"
$imagesDir = "$jhPath\imgs"

# Get random image from jhimgs folder
$image = Get-ChildItem -Path $imagesDir | Get-Random

# Set the random image as desktop background
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /f /t REG_SZ /d "$imagesDir\$image"
reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /f /t REG_SZ /d 10
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters