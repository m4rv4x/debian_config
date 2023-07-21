#!/bin/bash

# Update and upgrade packages
sudo apt-get update && sudo apt-get upgrade -y

# Install Github-cli
wget https://github.com/cli/cli/releases/download/v2.32.0/gh_2.32.0_linux_amd64.deb
sudo dpkg -i gh_2.32.0_linux_amd64.deb
rm -r gh_2.32.0_linux_amd64.deb

# Install system admin packages
sudo apt-get install htop git nmap micro netcat byobu curl speedtest-cli zsh neofetch exa ncdu curl wget  -y
byobu-ctrl-a screen

# Install useful developer packages
sudo apt-get install open-ssl python3 git python3-venvapt-transport-https ca-certificates gnupg lsb-release -y

# Install zsh and set as default shell
chsh -s $(which zsh)
# Install Oh My Zsh for better zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clean up
sudo apt-get autoremove -y
sudo apt-get clean

# Init GitHub account
gh auth login
echo "[!] Install Done"
