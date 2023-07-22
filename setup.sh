#!/bin/bash
cp ./zshrc/aliases ~/.aliases

# Update and upgrade packages
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install curl wget -y

# Install Latest node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\

# Install system admin packages
sudo apt-get install htop nmap micro byobu zsh exa ncdu -y
sudo apt-get install neofetch -y
sudo apt-get install speedtest-cli -y
sudo apt-get install open-ssl -y
sudo apt-get install netcat -y
sudo apt install gcc g++ make -y
byobu-ctrl-a screen
byobu-enable

# Install useful developer packages
sudo apt-get install build-essential nodejs python3 python3-pip git gnupg lsb-release -y
sudo apt-get gnupg lsb-release -y

# Install zsh and set as default shell
chsh -s $(which zsh)
# Install Oh My Zsh for better zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clean up
sudo apt-get autoremove -y
sudo apt-get clean

# Install Github-cli
wget https://github.com/cli/cli/releases/download/v2.32.0/gh_2.32.0_linux_amd64.deb
sudo dpkg -i gh_2.32.0_linux_amd64.deb
rm -r gh_2.32.0_linux_amd64.deb
# Init GitHub account
gh auth login
echo "[!] Install Done"
