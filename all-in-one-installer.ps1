# choose-install.ps1
# -------------------
# Simple CLI tool to install app packages via winget
# Choose from Gaming, Web Dev, or My Go-To setup

function Show-Menu {
    Clear-Host
    Write-Host "==============================="
    Write-Host "   Software Installation Tool"
    Write-Host "==============================="
    Write-Host "1. Gaming Setup"
    Write-Host "2. Web Development Setup"
    Write-Host "3. My Go-To Setup"
    Write-Host "4. Exit"
    Write-Host ""
}

function Install-Apps($apps) {
    foreach ($app in $apps) {
        Write-Host "`nInstalling $app..." -ForegroundColor Yellow
        winget install --id=$app -e --accept-package-agreements --accept-source-agreements
    }
    Write-Host "`nAll selected apps installed!" -ForegroundColor Green
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
    "Microsoft.WindowsTerminal"
)

# Start CLI loop
do {
    Show-Menu
    $choice = Read-Host "Select an option (1-4)"

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
            Write-Host "`nStarting My Go-To Setup..." -ForegroundColor Cyan
            Install-Apps -apps $myGoToapps
        }
        "4" {
            Write-Host "`nExiting. Goodbye!" -ForegroundColor Magenta
        }
        default {
            Write-Host "`nInvalid option. Please choose 1, 2, 3, or 4." -ForegroundColor Red
        }
    }

    if ($choice -ne "4") {
        Read-Host "`nPress Enter to return to the menu..."
    }
}
while ($choice -ne "4")
