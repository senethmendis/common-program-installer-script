# ⚙️ My Bulk Windows App Installer CLI

This tool is a simple command-line interface (CLI) that allows you to choose between a **Gaming Setup** or a **Web Development Setup** and installs a collection of essential applications using `winget`.

It has been compiled into a `.exe` file for easy use and even includes a custom icon!

---

## 📦 What's Included

### 🎮 Gaming Setup Includes:
- Google Chrome
- Discord
- TeamSpeak
- Steam
- Epic Games Launcher
- Ubisoft Connect
- EA Desktop App
- Razer Cortex
- MSI Afterburner
- GPU-Z
- CrystalDiskInfo
- NVIDIA GeForce Experience
- HWiNFO
- 7-Zip
- VLC Media Player
- Xbox App
- Windows Terminal

### 💻 Web Developer Setup Includes:
- Google Chrome
- Mozilla Firefox
- Microsoft Edge Dev
- Visual Studio Code
- Node.js LTS
- Git & GitHub Desktop
- Postman
- Docker Desktop
- Notepad++
- MongoDB Compass
- MySQL Workbench
- RedisInsight
- SQLite Browser
- 7-Zip
- VLC Media Player
- Figma
- Windows Terminal

---

## 🚀 How to Use

### ✅ Method 1: Use the EXE file

1. Download `ChooseInstaller.exe`
2. Double-click to run it
3. Choose your setup type (1 for Gaming, 2 for Web Development)

### ✅ Method 2: Run from PowerShell (script version)

1. Open PowerShell
2. Navigate to the folder containing `choose-install.ps1`
3. Run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\choose-install.ps1
