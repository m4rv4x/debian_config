#!/bin/bash

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install Latest node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\

# Install dev packages
sudo apt install cmake npm nodejs -y
sudo apt install gcc g++ make -y
sudo apt install build-essential nodejs -y

# Install Github-cli
wget https://github.com/cli/cli/releases/download/v2.32.0/gh_2.32.0_linux_amd64.deb
sudo dpkg -i gh_2.32.0_linux_amd64.deb
rm -r gh_2.32.0_linux_amd64.deb

# Init GitHub account
gh auth login
echo "[!] Install Done"
