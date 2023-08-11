#!/bin/bash

# Update only
sudo apt update -y

# Check if git is installed
if dpkg -s git &> /dev/null; then
    echo -e "\e[32mGit is already installed\e[0m"
else
    echo -e "\e[33mGit is not installed\e[0m"
    sudo apt install git -y
fi

# Install curl if it exists in the packet manager
if dpkg -s curl &> /dev/null; then
    echo -e "\e[32mCurl is already installed\e[0m"
else
    echo -e "\e[33mCurl is not installed\e[0m"
    sudo apt install curl -y
fi

# Install wget if it exists in the packet manager
if dpkg -s wget &> /dev/null; then
    echo -e "\e[32mWget is already installed\e[0m"
else
    echo -e "\e[33mWget is not installed\e[0m"
    sudo apt install wget -y
fi

# Install system admin packages
if dpkg -s htop nmap micro exa byobu ncdu neofetch &> /dev/null; then
    echo -e "\e[32mSystem admin packages are already installed\e[0m"
else
    echo -e "\e[33mSystem admin packages are not installed\e[0m"
    sudo apt install htop nmap micro exa byobu ncdu neofetch -y
fi
if dpkg -s speedtest-cli openssl ncat &> /dev/null; then
    echo -e "\e[32mSpeedtest-cli, open-ssl, and netcat are already installed\e[0m"
else
    echo -e "\e[33mSpeedtest-cli, open-ssl, and netcat are not installed\e[0m"
    sudo apt install speedtest-cli open-ssl netcat -y
fi
if dpkg -s gcc g++ make &> /dev/null; then
    echo -e "\e[32mGCC, g++, and make are already installed\e[0m"
else
    echo -e "\e[33mGCC, g++, and make are not installed\e[0m"
    sudo apt install gcc g++ make -y
fi

# Install useful developer packages
if dpkg -s python3 pipx &> /dev/null; then
    echo -e "\e[32mPython3 and pipx are already installed\e[0m"
else
    echo -e "\e[33mPython3 and pipx are not installed\e[0m"
    sudo apt install python3 pipx -y
fi
if dpkg -s build-essential &> /dev/null; then
    echo -e "\e[32mBuild-essential is already installed\e[0m"
else
    echo -e "\e[33mBuild-essential is not installed\e[0m"
    sudo apt install build-essential -y
fi
if dpkg -s gnupg lsb-release &> /dev/null; then
    echo -e "\e[32mGnupg and lsb-release are already installed\e[0m"
else
    echo -e "\e[33mGnupg and lsb-release are not installed\e[0m"
    sudo apt install gnupg lsb-release -y
fi

# Install Shell Additions
if dpkg -s zsh zsh-antigen zsh-autosuggestions zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k &> /dev/null; then
    echo -e "\e[32mZsh and shell additions are already installed\e[0m"
else
    echo -e "\e[33mZsh and shell additions are not installed\e[0m"
    sudo apt install zsh zsh-antigen zsh-autosuggestions zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k
    # Install zsh and set as default shell
    chsh -s $(which zsh)
fi

# Verify if Oh My Zsh is not installed before trying to install
if [ -d ~/.oh-my-zsh ]; then
    echo -e "\e[32mOh My Zsh is already installed\e[0m"
else
    echo -e "\e[33mOh My Zsh is not installed\e[0m"
    # Install Oh My Zsh for better zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# Add some ZSH CONFIG
if [ -z "$COPY_CONFIG" ]; then
    read -t 60 -p "Copy config files? (y/n): " COPY_CONFIG
fi

if [[ "$COPY_CONFIG" =~ ^[yY](es)?$ ]]; then
    # Set the path to the script path from bash env
    SCRIPT_PATH=$(dirname "$(readlink -f "$0")")

    cp "$SCRIPT_PATH/config/zshrc/aliases" ~/.aliases
    cp "$SCRIPT_PATH/config/zshrc/ohmyzsh.rc" ~/.zshrc
    echo -e "\e[32mZSH CONFIG copied\e[0m"
else
    echo -e "\e[33mSkipping copying config files\e[0m"
fi

# Reload
echo -e "\e[32mRELOADING\e[0m"
source ~/.zshrc
source ~/.aliases
# Clean up
sudo apt autoremove -y
sudo apt clean
echo -e "\e[32mDONE\e[0m"
