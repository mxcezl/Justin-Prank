# Get images directory
$jhPath = "$env:userprofile\jh"
$imagesDir = "$jhPath\imgs"

# Read registry to get current wallpaper
$wallpaperName = (Get-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper).Wallpaper.Split("\")[-1]
Write-Host "Current wallpaper: $wallpaperName"

# Get random image from jhimgs folder (except current wallpaper)
$newBackgroungImageName = Get-ChildItem -Path $imagesDir | Where-Object {$_.Name -ne $wallpaperName} | Get-Random
Write-Host "New wallpaper: $newBackgroungImageName"

# Set the random image as desktop background
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

add-type $code 

#Apply the Change on the system 
[Win32.Wallpaper]::SetWallpaper("$imagesDir/$newBackgroungImageName")
