#!/bin/bash

# Update and upgrade packages
sudo apt-get update && sudo apt-get upgrade -y

# Install useful developer packages
sudo apt-get install build-essential nodejs python3 git curl wget zsh -y

# Install Docker
sudo apt-get install apt-transport-https ca-certificates gnupg lsb-release -y
sudo apt-get install docker.io docker-compose -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Install system admin packages
sudo apt-get install htop nmap byobu curl node speedtest-cli -y

# Install zsh and set as default shell
sudo apt-get install zsh -y
chsh -s $(which zsh)
 
# Install neofetch and exa
sudo apt-get install neofetch exa -y

# Clean up
sudo apt-get autoremove -y
sudo apt-get clean


