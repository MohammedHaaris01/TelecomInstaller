# 🚀 srsRAN Full Automated Installer

**A one-click modular installer for srsRAN, srsGUI, Open5GS, and all dependencies.**

This repository provides **modular Bash scripts** to fully install and set up the **srsRAN ecosystem** on Ubuntu-based systems. It ensures all required dependencies, drivers, and repositories are installed in the user’s home directory, even when run with `sudo`.

---

## ✨ Features

* **Fully automated, non-interactive installation.**
* Modular scripts for:
    * Dependencies & build tools
    * Open5GS + MongoDB + Node.js + WebUI
    * srsGUI
    * srsRAN\_4G (Legacy)
    * srsRAN\_Project (Current)
* Clones all repositories into the **home directory** (`~`) to avoid permission issues.
* Supports **one-click installation** via terminal or a `.desktop` GUI launcher.
* Logs each step to a separate `.log` file for easy debugging.

---

## 📋 Prerequisites

| Requirement | Details |
| :--- | :--- |
| **Operating System** | **Ubuntu 22.04+** or compatible Ubuntu-based distributions. |
| **Connectivity** | Active **Internet connection**. |
| **Permissions** | **Sudo privileges** (required to install system dependencies). |

---

## 🛠️ Installation Guide

### Step 1: Clone the repository

Open your terminal and clone the installer repository:

```bash
git clone https://github.com/MohammedHaaris01/TelecomInstaller.git ~/srsRAN-installer
cd ~/srsRAN-installer
```

### Step 2: Make all scripts executable
Ensure all scripts have the necessary execution permissions:
```bash
chmod +x *.sh
```

### Important: The Scripts should be run strictly in the following order

### Step 3: Run the scripts
Run each module separately in the following order:
```bash
sudo ./dependencies.sh
sudo ./open5gs.sh
sudo ./srsGUI.sh
sudo ./srsRAN_4G.sh
sudo ./srsRAN_Project.sh
```
### Step 4: Verify srsRAN and srsGUI
Check that the binaries were installed successfully and are available in your system's path:
```bash
srsenb --version
```

### 💡 Notes
* All scripts will clone repositories into the user’s home directory (~), even when run with sudo, to prevent future permission conflicts during development.

* If a repository already exists in the target location, the script will skip cloning and proceed directly to the build step.

* Each major step logs its output to a dedicated .log file for easy troubleshooting.

### 🤝 Contributing
We welcome contributions! Feel free to submit *issues*, feature requests, or *pull requests* if you want to improve this installer.
