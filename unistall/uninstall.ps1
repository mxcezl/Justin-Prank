# Delete scheduled task
Write-Host "Deleting scheduled task..."

# Check if scheduled task exists
$task = schtasks /query /tn "JustinWPPrank"

# If scheduled task exists, delete it
if($task){
    schtasks /delete /tn "JustinWPPrank" /f
} else {
    Write-Host "Scheduled task not found!"
}

# Delete install folder
Write-Host "Deleting install folder..."
$installDir = "$env:userprofile\jh"
if(Test-Path $installDir){
    Remove-Item -Path $installDir -Recurse -Force
    Write-Host "Done!"
} else {
    Write-Host "Install folder not found"
}
