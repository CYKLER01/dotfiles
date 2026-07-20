#!/bin/bash
mkdir -p ~/Applications
cd ~/Applications

# Download appimages
wget -O SatisfactoryModManager.AppImage "https://github.com/SatisfactoryModding/SatisfactoryModManager/releases/download/v2.1.2/SatisfactoryModManager-linux-x86_64.AppImage"
wget -O BambuStudio.AppImage "https://github.com/bambulab/BambuStudio/releases/download/v02.07.01.62/BambuStudio_ubuntu22.04-v02.07.01.62-20260616195227.AppImage"
wget -O LunarClient.AppImage "https://launcherupdates.lunarclientcdn.com/Lunar%20Client-3.7.12-ow.AppImage"
wget -O r2modman.AppImage "https://github.com/ebkr/r2modmanPlus/releases/download/v3.2.18/r2modman-3.2.18.AppImage"

# Make them executable
chmod +x *.AppImage
