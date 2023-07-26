#!/bin/bash
sudo nmcli connection import type openvpn file ~/Downloads/profile-21.ovpn
sudo nmcli connection up "profile-21"
