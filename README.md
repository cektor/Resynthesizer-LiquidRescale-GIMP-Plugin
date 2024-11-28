# Resynthesizer-LiquidRescale-GIMP-Plugin
This bash script is designed to ensure the proper installation, update and installation of GIMP (GNU Image Manipulation Program) on Linux (apt/dep) based operating systems. The script uninstalls the pre-installed GIMP application, installs Flatpak, installs GIMP via Flatpak and installs the necessary additional GIMP plugins (Resynthesizer and LiquidRescale).

# Main Features:
Root Authorization Check: Checks that the script should be run with root (administrator) privileges. If it is not run with root privileges, the user will be notified to run it with the correct command.
Uninstalling GIMP with APT: If GIMP is installed via APT, the script uninstalls GIMP and all associated packages (gimp-data, gimp-plugin-registry).
GIMP Control with Flatpak: The script checks for an installed version of GIMP with Flatpak on the system. If not, Flatpak is installed.
Install GNOME Software Flatpak Plugin: Install the necessary plugin to manage Flatpak applications with GNOME Software.
Add Flathub Repository: The Flathub repository is added to your system to allow installation of GIMP and other Flatpak applications.
Flatpak GIMP Installation: GIMP is installed with Flatpak via Flathub.
GIMP Plugins Installation: Popular GIMP plugins such as Resynthesizer and LiquidRescale are also installed.
# Benefits to the User:
Easy Installation and Update: This script installs GIMP via Flatpak and keeps it up to date, so you can easily get the latest version of GIMP and plugins.
Error Management: Error checking is done at every step. If an operation fails, the script stops and the user receives a meaningful error message.
Working with Administrator Rights: Provides a secure environment by informing that the script should only run with administrator rights.

----------------------------------

# Usage:
You can use the script by running it from a terminal.
You must have root (administrator) privileges for the script to work properly. Therefore, you need to run the script with the sudo command.
Install Git Clone 

Github Package Must Be Installed On Your Device.
```bash
sudo apt install git  -y
```
----------------------------------

# Installation
Install Resynthesizer-LiquidRescale-GIMP-Plugin

```bash
sudo git clone https://github.com/cektor/Resynthesizer-LiquidRescale-GIMP-Plugin.git
```
```bash
cd Resynthesizer-LiquidRescale-GIMP-Plugin/

```
```bash
sudo chmod +x gg.sh
```
```bash
sudo ./gg.sh
```



