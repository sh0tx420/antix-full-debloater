#!/bin/bash

# Variables
FILE_PKGS="bloat-packages.txt"

# Purge packages that are in the file
while read -r line; do
    sudo apt purge -y "$line"
done <$FILE_PKGS

# Remove the dependencies from removed packages
sudo apt autoremove
echo -e "\e[1;33mPurged all unnecessary packages.\e[0m"

# Remove useless files from home directory
cd ~/
sudo rm -rfv .cache/ .dbus/ .desktop-session/ .dillo/ .foxrc/ .fluxbox/ .gconf/ .jwm/ .mcthemes/ .screenlayout/ .xmms/ .newsboat/ .icewm/ .icons/
sudo rm -rfv Desktop/ Documents/ Downloads/ Music/ Pictures/ Videos/
sudo rm -fv .conky* .gexec .gtk* .jwm* .nanorc .Xauthority .Xresources .smb* .fehbg
echo -e "\e[1;33mRemoved unnecessary files from home directory.\e[0m"
