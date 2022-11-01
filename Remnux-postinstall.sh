#!/bin/bash


# TODO
#
#
#
# 7z
# background
# zsh
# zsh theme
# auditd

# Annen terminal
# Evt. flere terminalprofiler
# Key bindings



# Install Sublime text
Echo "[+] Installing Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

Echo "[+] Installing whois"
sudo apt-get install whois

Echo "[+] Installing Zsh"
sudo apt install zsh

Echo "[+] Setting Zsh as default shell"
chsh -s $(which zsh)