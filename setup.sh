#!/bin/bash

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y
sudo apt install git curl wget -y

# Install system admin packages
sudo apt install htop nmap micro exa byobu ncdu neofetch -y
sudo apt install speedtest-cli open-ssl netcat-y
sudo apt install gcc g++ make -y

# Install useful developer packages
sudo apt install python3 pipx -y
sudo apt install build-essential -y
sudo apt install gnupg lsb-release -y

# Install Shell Additions
sudo apt install zsh zsh-antigen zsh-autosuggestions zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k
# Install zsh and set as default shell
chsh -s $(which zsh)
# Install Oh My Zsh for better zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Add some ZSH CONFIG
cp ./zshrc/aliases ~/.aliases
cp ./zshrc/ohmy.zshrc ~/.zshrc

# Reload
source ~/.zshrc
source ~/.aliases
# Clean up
sudo apt autoremove -y
sudo apt clean
