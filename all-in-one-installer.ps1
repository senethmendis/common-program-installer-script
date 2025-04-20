# -------------------
# Simple CLI tool to install app packages via winget
# Choose from Gaming, Minimal Gaming, Web Dev, or Go-To setups
# -------------------

function Show-Menu {
    Clear-Host
    Write-Host "==============================="
    Write-Host "   Software Installation Tool"
    Write-Host "==============================="
    Write-Host "1. Gaming Setup"
    Write-Host "2. Minimal Gaming Setup"
    Write-Host "3. Web Development Setup"
    Write-Host "4. My Go-To Setup"
    Write-Host "5. Exit"
    Write-Host ""
    Write-Host "==============================="
}

function Show-Spinner {
    $spinner = @("|", "/", "-", "\")
    for ($i = 0; $i -lt 10; $i++) {
        foreach ($frame in $spinner) {
            Write-Host -NoNewline "`rLoading $frame"
            Start-Sleep -Milliseconds 100
        }
    }
    Write-Host "`r               `r"  # Clear the line
}

function Install-Apps($apps) {
    foreach ($app in $apps) {
        # Check if the app is already installed
        $isInstalled = winget list --id=$app -e | Select-String $app

        if ($isInstalled) {
            Write-Host "`n$app is already installed. Skipping..." -ForegroundColor Gray
        } else {
            Write-Host "`nInstalling $app..." -ForegroundColor Yellow
            Show-Spinner
            winget install --id=$app -e --accept-package-agreements --accept-source-agreements
        }
    }
    Write-Host "`nAll selected apps processed!" -ForegroundColor Green
}


# App lists
$gamingApps = @(
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

$minimalForGamer = @(
    "Discord.Discord",
    "TeamSpeakSystems.TeamSpeakClient",
    "Valve.Steam",
    "Nvidia.GeForceExperience",
    "7zip.7zip"
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
    $choice = Read-Host "Select an option (1-5)"

    switch ($choice) {
        "1" {
            Write-Host "`nStarting Gaming Setup..." -ForegroundColor Cyan
            Install-Apps -apps $gamingApps
        }
        "2" {
            Write-Host "`nStarting Minimal Gaming Setup..." -ForegroundColor Cyan
            Install-Apps -apps $minimalForGamer
        }
        "3" {
            Write-Host "`nStarting Web Development Setup..." -ForegroundColor Cyan
            Install-Apps -apps $webDevApps
        }
        "4" {
            Write-Host "`nStarting My Go-To Setup..." -ForegroundColor Cyan
            Install-Apps -apps $myGoToapps
        }
        "5" {
            Write-Host "`nExiting. Goodbye!" -ForegroundColor Magenta
        }
        default {
            Write-Host "`nInvalid option. Please choose 1 to 5." -ForegroundColor Red
        }
    }

    if ($choice -ne "5") {
        Read-Host "`nPress Enter to return to the menu..."
    }
}
while ($choice -ne "5")
