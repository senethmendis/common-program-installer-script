# install-programs.ps1

# Make sure the script is running with Administrator rights
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Please run this script as Administrator!"
    exit
}

# List of apps to install (by Winget ID)
$apps = @(
    "Google.Chrome",                        # Web browser
    "Discord.Discord",                      # Voice chat and gaming communities
    "TeamSpeakSystems.TeamSpeakClient",     # Alternative voice comms
    "Valve.Steam",                          # Game launcher/store
    "EpicGames.EpicGamesLauncher",          # Epic Games store
    "Ubisoft.Connect",                      # Ubisoft launcher
    "ElectronicArts.EADesktop",             # EA App (formerly Origin)
    "Razer.Cortex",                         # Game booster and system optimizer
    "MSI.Afterburner",                      # GPU monitoring & overclocking
    "TechPowerUp.GPU-Z",                    # GPU info
    "Nvidia.GeForceExperience",             # Nvidia GPU drivers + ShadowPlay
    "7zip.7zip",                            # Extract game mods or tools
    "Microsoft.WindowsTerminal"             # Terminal for power users
)


foreach ($app in $apps) {
    Write-Host "Installing $app..."
    winget install --id=$app -e --accept-package-agreements --accept-source-agreements
}
