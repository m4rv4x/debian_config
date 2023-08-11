#!/bin/bash

# Just update
sudo apt update -y

# Verify if node is installed before trying to install
if dpkg -s nodejs &> /dev/null; then
    echo "nodejs is already installed"
else
    # Install Latest node.js
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
fi

# Verify if packages are installed before trying to install
if dpkg -s cmake &> /dev/null; then
    echo "cmake is already installed"
else
    # Install cmake
    sudo apt install cmake -y
fi

if dpkg -s npm &> /dev/null; then
    echo "npm is already installed"
else
    # Install npm
    sudo apt install npm -y
fi

if dpkg -s nodejs &> /dev/null; then
    echo "nodejs is already installed"
else
    # Install nodejs
    sudo apt install nodejs -y
fi

if dpkg -s gcc &> /dev/null; then
    echo "gcc is already installed"
else
    # Install gcc
    sudo apt install gcc -y
fi

if dpkg -s g++ &> /dev/null; then
    echo "g++ is already installed"
else
    # Install g++
    sudo apt install g++ -y
fi

if dpkg -s make &> /dev/null; then
    echo "make is already installed"
else
    # Install make
    sudo apt install make -y
fi

# Verify if gh is installed before trying to install
if dpkg -s gh &> /dev/null; then
    echo "gh is already installed"
else
    # Install Github-cli
    wget https://github.com/cli/cli/releases/download/v2.32.0/gh_2.32.0_linux_amd64.deb
    sudo dpkg -i gh_2.32.0_linux_amd64.deb
    rm -r gh_2.32.0_linux_amd64.deb
fi

# Init GitHub account
gh auth login
echo "[!] Install Done"

