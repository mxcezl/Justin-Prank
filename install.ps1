# Check if user is admin
#$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
#$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# Get current dir
$dir = Get-Location

# URL to download
$url = "https://raw.githubusercontent.com/FredericMartinez/justin-hack/master/install.sh"

# Download file
$client = new-object System.Net.WebClient
$client.DownloadFile($url, "$dir\install.ps1")

# Run file
& "$dir\install.ps1"