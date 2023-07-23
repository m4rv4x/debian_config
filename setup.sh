#!/bin/bash
cp ./zshrc/aliases ~/.aliases

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y
sudo apt install git curl wget -y

# Install Latest node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\

# Install system admin packages
sudo apt install htop nmap micro zsh exa -y
sudo apt install byobu -y
sudo apt install ncdu -y
sudo apt install neofetch -y
sudo apt install speedtest-cli -y
sudo apt install open-ssl -y
sudo apt install netcat -y
sudo apt install gcc g++ make -y
byobu-ctrl-a screen
byobu-enable

# Install useful developer packages
sudo apt install python3-full -y
sudo apt install python3-pip -y
sudo apt install build-essential nodejs -y
sudo apt install gnupg lsb-release -y

# Install zsh and set as default shell
chsh -s $(which zsh)
# Install Oh My Zsh for better zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clean up
sudo apt autoremove -y
sudo apt clean

# Install Github-cli
wget https://github.com/cli/cli/releases/download/v2.32.0/gh_2.32.0_linux_amd64.deb
sudo dpkg -i gh_2.32.0_linux_amd64.deb
rm -r gh_2.32.0_linux_amd64.deb
# Init GitHub account
gh auth login
echo "[!] Install Done"
