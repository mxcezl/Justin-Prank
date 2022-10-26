# Get images directory
$jhPath = "$env:userprofile\jh"
$imagesDir = "$jhPath\imgs"

# Read registry to get current wallpaper
$wallpaperName = (Get-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper).Wallpaper.Split("\")[-1]
Write-Host "Current wallpaper: $wallpaperName"

# Get random image from jhimgs folder (except current wallpaper)
$image = Get-ChildItem -Path $imagesDir | Where-Object {$_.Name -ne $wallpaperName} | Get-Random
Write-Host "New wallpaper: $image"

# Set the random image as desktop background
$regPath = "HKCU\Control Panel\Desktop"
reg add $regPath /v Wallpaper /f /t REG_SZ /d "$imagesDir\$image" | Out-Null
reg add $regPath /v WallpaperStyle /f /t REG_SZ /d 10 | Out-Null

# Refresh desktop
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters

# Wait for 10 seconds
Start-Sleep -s 10

# Re-refresh desktop because sometimes it doesn't work
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
