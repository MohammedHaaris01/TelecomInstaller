**srsRAN Full Automated Installer**

A one-click modular installer for srsRAN, srsGUI, Open5GS, and all dependencies

This repository provides modular Bash scripts to fully install and set up the srsRAN ecosystem on Ubuntu-based systems. It ensures all required dependencies, drivers, and repositories are installed in the user’s home directory, even when run with sudo.

Features:
  Fully automated, non-interactive installation.

Modular scripts for:
  Dependencies & build tools
  Open5GS + MongoDB + Node.js + WebUI
  srsGUI
  srsRAN_4G
  srsRAN_Project
  Clones all repositories into the home directory to avoid permission issues.
  Supports one-click installation via terminal or .desktop GUI launcher.
  Logs each step to a separate .log file for easy debugging.

Prerequisites
  Ubuntu 22.04+ or compatible Ubuntu-based distributions.
  Internet connection.
  Sudo privileges.

Installation Guide

Step 1: Clone the repository
  git clone https://github.com/<your-username>/srsRAN-installer.git ~/srsRAN-installer
  cd ~/srsRAN-installer

Step 2: Make all scripts executable
  chmod +x *.sh

Step 3: Run the scripts in order
  sudo ./dependencies.sh
  sudo ./open5gs.sh
  sudo ./srsGUI.sh
  sudo ./srsRAN_4G.sh
  sudo ./srsRAN_Project.sh

Step 5: Verify srsRAN and srsGUI
Check if the binaries were installed successfully:
  srsenb --version
  srsGUI --version

Notes:
All scripts will clone repositories into the user’s home, even when run with sudo.
If a repository already exists, the script will skip cloning and continue to build.
Each step logs output to a .log file for easy troubleshooting.

Contributing
Feel free to submit issues, feature requests, or pull requests if you want to improve this installer.
