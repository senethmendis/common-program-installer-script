# install-programs.ps1

# Make sure the script is running with Administrator rights
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Please run this script as Administrator!"
    exit
}

# List of apps to install (by Winget ID)
$apps = @(
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "OpenJS.NodeJS.LTS",
    "Git.Git",
    "7zip.7zip",
    "VideoLAN.VLC",
    "Discord.Discord",
    "TeamSpeakSystems.TeamSpeakClient",
    "Valve.Steam",
    "Postman.Postman",
    "GitHub.GitHubDesktop",
    "Microsoft.WindowsTerminal",
)

foreach ($app in $apps) {
    Write-Host "Installing $app..."
    winget install --id=$app -e --accept-package-agreements --accept-source-agreements
}
