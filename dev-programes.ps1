# install-programs.ps1

# Make sure the script is running with Administrator rights
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Please run this script as Administrator!"
    exit
}

# List of apps to install (by Winget ID)
$apps = @(
    "Google.Chrome",                         # Main browser for dev & testing
    "Mozilla.Firefox",                       # Alternative browser (DevTools)
    "Microsoft.VisualStudioCode",            # Code editor
    "OpenJS.NodeJS.LTS",                     # Node.js LTS (JavaScript runtime)
    "Git.Git",                               # Git version control
    "GitHub.GitHubDesktop",                  # GitHub GUI client
    "Postman.Postman",                       # API testing tool
    "Docker.DockerDesktop",                  # Containerization for local dev
    "Notepad++.Notepad++",                   # Lightweight text/code editor
    "MongoDB.Compass",                       # MongoDB GUI
    "MySQL.MySQLWorkbench",                  # MySQL database GUI
    "SQLiteBrowser.sqlitebrowser",           # SQLite visual DB tool
    "7zip.7zip",                             # File archiver
    "VideoLAN.VLC",                          # Optional 
    "Figma.Figma",                           # UI/UX design tool (desktop)
    "Microsoft.WindowsTerminal"              # Terminal for shell/CLI work
)



foreach ($app in $apps) {
    Write-Host "Installing $app..."
    winget install --id=$app -e --accept-package-agreements --accept-source-agreements
}
