#!/bin/bash

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Check if git is installed
if dpkg -s git &> /dev/null; then
    echo "Git is already installed"
else
    echo "Git is not installed"
fi

# Install curl if it exists in the packet manager
if dpkg -s curl &> /dev/null; then
    echo "Curl is already installed"
else
    sudo apt install curl -y
fi

# Install wget if it exists in the packet manager
if dpkg -s wget &> /dev/null; then
    echo "Wget is already installed"
else
    sudo apt install wget -y
fi

# Install system admin packages
if dpkg -s htop nmap micro exa byobu ncdu neofetch &> /dev/null; then
    echo "System admin packages are already installed"
else
    sudo apt install htop nmap micro exa byobu ncdu neofetch -y
fi
if dpkg -s speedtest-cli open-ssl netcat &> /dev/null; then
    echo "Speedtest-cli, open-ssl, and netcat are already installed"
else
    sudo apt install speedtest-cli open-ssl netcat -y
fi
if dpkg -s gcc g++ make &> /dev/null; then
    echo "GCC, g++, and make are already installed"
else
    sudo apt install gcc g++ make -y
fi

# Install useful developer packages
if dpkg -s python3 pipx &> /dev/null; then
    echo "Python3 and pipx are already installed"
else
    sudo apt install python3 pipx -y
fi
if dpkg -s build-essential &> /dev/null; then
    echo "Build-essential is already installed"
else
    sudo apt install build-essential -y
fi
if dpkg -s gnupg lsb-release &> /dev/null; then
    echo "Gnupg and lsb-release are already installed"
else
    sudo apt install gnupg lsb-release -y
fi

# Install Shell Additions
if dpkg -s zsh zsh-antigen zsh-autosuggestions zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k &> /dev/null; then
    echo "Zsh and shell additions are already installed"
else
    sudo apt install zsh zsh-antigen zsh-autosuggestions zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k
fi
# Install zsh and set as default shell
chsh -s $(which zsh)
# Verify if Oh My Zsh is not installed before trying to install
if ! dpkg -s ohmyzsh &> /dev/null; then
    # Install Oh My Zsh for better zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Add some ZSH CONFIG
cp ./zshrc/aliases ~/.aliases
cp ./zshrc/ohmy.zshrc ~/.zshrc

# Reload
source ~/.zshrc
source ~/.aliases
# Clean up
sudo apt autoremove -y
sudo apt clean
