#!/bin/bash
if dpkg -s network-manager-openvpn-gnome &> /dev/null; then
    echo "OPENVPN PLUGIN already installed"
else
    apt update
    apt install apt-transport-https nmcli nmtui network-manager-open-vpn-gnome
    apt install network-manager-open-vpn
fi
nmcli connection import type openvpn file  ~/openvpn/profile.ovpn
