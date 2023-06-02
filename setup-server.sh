#!/bin/bash

# Update and upgrade packages
sudo apt-get update && sudo apt-get upgrade -y

# Install system admin packages
sudo apt-get install htop nmap byobu curl speedtest-cli gcc g++ make -y

# Install Latest node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# Install useful developer packages
sudo apt-get install build-essential nodejs python3 python3-venv git curl wget zsh -y

# Install Docker
sudo apt-get install apt-transport-https ca-certificates gnupg lsb-release -y
sudo apt-get install docker.io docker-compose -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# Using Docker without sudo in Debian
# The first step is to create a new user group named docker:
sudo groupadd docker
# Now, you can add the user to the docker user group with the usermod command:
sudo usermod -aG docker $USER

# Install zsh and set as default shell
sudo apt-get install zsh -y
chsh -s $(which zsh)
 
# Install neofetch and exa
sudo apt-get install neofetch exa ncdu -y

# Install Oh My Zsh for better zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Upgrading zsh again
wget https://raw.githubusercontent.com/m4rv4x/debian_config/main/.zshrc -o ~/.zshrc

# Clean up
sudo apt-get autoremove -y
sudo apt-get clean
