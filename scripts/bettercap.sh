#!/bin/bash

sudo apt update
sudo apt install golang git build-essential libpcap-dev libusb-1.0-0-dev libnetfilter-queue-dev
git clone https://github.com/bettercap/bettercap.git
cd bettercap
make build
sudo make install
cd ..
git clone https://github.com/bettercap/caplets.git
cd caplets
sudo make install
cd ..
sudo bettercap
