# Delete scheduled task
schtasks /Delete /tn "JustinWPPrank" /F

# Delete install folder
$installDir = "$env:userprofile\jh"
Remove-Item -Path $installDir -Recurse -Force
