# choose-install.ps1

function Show-Menu {
    Clear-Host
    Write-Host "==============================="
    Write-Host "   Software Installation Tool"
    Write-Host "==============================="
    Write-Host "1. Gaming Setup"
    Write-Host "2. Web Development Setup"
    Write-Host "3. Exit"
    Write-Host ""
}

function Install-Apps($apps) {
    foreach ($app in $apps) {
        Write-Host "`nInstalling $app..."
        winget install --id=$app -e --accept-package-agreements --accept-source-agreements
    }
}

# App lists
$gamingApps = @(
    "Google.Chrome",
    "Discord.Discord",
    "TeamSpeakSystems.TeamSpeakClient",
    "Valve.Steam",
    "EpicGames.EpicGamesLauncher",
    "Ubisoft.Connect",
    "ElectronicArts.EADesktop",
    "Razer.Cortex",
    "MSI.Afterburner",
    "TechPowerUp.GPU-Z",
    "CrystalDewWorld.CrystalDiskInfo",
    "Nvidia.GeForceExperience",
    "REALiX.HWiNFO",
    "7zip.7zip",
    "VideoLAN.VLC",
    "Microsoft.XboxApp",
    "Microsoft.WindowsTerminal"
)

$webDevApps = @(
    "Google.Chrome",
    "Mozilla.Firefox",
    "Microsoft.Edge.Dev",
    "Microsoft.VisualStudioCode",
    "OpenJS.NodeJS.LTS",
    "Git.Git",
    "GitHub.GitHubDesktop",
    "Postman.Postman",
    "Docker.DockerDesktop",
    "Notepad++.Notepad++",
    "MongoDB.Compass",
    "MySQL.MySQLWorkbench",
    "Redis.RedisInsight",
    "SQLiteBrowser.sqlitebrowser",
    "7zip.7zip",
    "VideoLAN.VLC",
    "Figma.Figma",
    "Microsoft.WindowsTerminal"
)

$myGoToapps = @(
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

# Start CLI loop
do {
    Show-Menu
    $choice = Read-Host "Select an option (1-3)"

    switch ($choice) {
        "1" {
            Write-Host "`nStarting Gaming Setup..." -ForegroundColor Cyan
            Install-Apps -apps $gamingApps
        }
        "2" {
            Write-Host "`nStarting Web Development Setup..." -ForegroundColor Cyan
            Install-Apps -apps $webDevApps
        }
        "3" {
            Write-Host "`nStarting Web Development Setup..." -ForegroundColor Cyan
            Install-Apps -apps $myGoToapps
        }
        "4" {
            Write-Host "Exiting..."
        }
        default {
            Write-Host "Invalid option. Please choose 1, 2, or 3." -ForegroundColor Red
        }
    }

    if ($choice -ne "3") {
        Read-Host "`nPress Enter to return to the menu..."
    }
}
while ($choice -ne "3")
