#!/bin/bash

# Update and upgrade packages
sudo apt-get update && sudo apt-get upgrade -y

# Install Latest node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\

# Upgrade docker-compose to version 3
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
# Create a new user group named docker:
sudo groupadd docker
# Now, you can add the user to the docker user group with the usermod command:
sudo usermod -aG docker $USER

# Upgrade Ruby to version 3 (or last)
gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io -o ~/rvm.sh
chmod +x ~/rvm.sh
./rvm/sh
rm -r ~/rvm.sh


# Install system admin packages
sudo apt-get install htop nmap micro netcat byobu curl speedtest-cli gcc g++ make zsh neofetch exa ncdu curl wget  -y
# Install useful developer packages
sudo apt-get install build-essential nodejs python3 git python3-venvapt-transport-https ca-certificates gnupg lsb-release -y
# Install some Python packages
pip install gh

# Install zsh and set as default shell
chsh -s $(which zsh)
 
# Install Oh My Zsh for better zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Upgrading zsh again
cp ./.zshrc ~/.zshrc
echo "source ~/.m4rc" >> ~/.zshrc
mv ./.m4rc ~/.m4rc

# Clean up
sudo apt-get autoremove -y
sudo apt-get clean

# Init GitHub account
gh auth login
echo "[!] Install Done"
