#!/bin/bash
if dpkg -s network-manager-openvpn-gnome &> /dev/null; then
    echo "OPENVPN PLUGIN already installed"
else
    sudo apt update
    sudo apt install apt-transport-https nmcli nmtui network-manager-open-vpn-gnome
    sudo apt install network-manager-open-vpn
fi

echo "Download your profile.ovpn from your OpenVPN Access Server and type in terminal:"
echo "--------------------------------------------------------------------------------"
echo "# Import profile"
echo "nmcli connection import type openvpn file <profile.ovpn>"
echo "# Connect"
echo "nmcli connection up "<profile>"