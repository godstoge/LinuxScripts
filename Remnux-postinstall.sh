#!/bin/bash


# TODO
#
#
#
# background
 
# Annen terminal
# Evt. flere terminalprofiler
# Key bindings



# Install Sublime text
Echo "[+] Installing Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text --assume-yes

Echo "[+] Installing whois"
sudo apt-get install whois --assume-yes

Echo "[+] Installing auditd"
sudo apt-get install auditd --assume-yes

Echo "[+] Installing tmux"
apt install tmux --assume-yes

Echo "[+] Installing Zsh"
sudo apt install zsh --assume-yes

Echo "[+] Setting Zsh as default shell"
chsh -s $(which zsh)

Echo "[+] Getting themes and configuring Zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="cypher"/g' ~/.zshrc
source ~/.zshrc
chsh -s $(which zsh) remnux

Echo "[+] Installing cargo"
sudo apt install cargo

Echo "[+] Cloning chainsaw and compiling it"
git clone https://github.com/countercept/chainsaw.git
git clone https://github.com/SigmaHQ/sigma
cd chainsaw
cargo build --release

#echo "[+] Set system name"
#hostnamectl set-hostname choosename

