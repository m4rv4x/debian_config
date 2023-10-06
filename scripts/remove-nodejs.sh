#!/bin/bash
echo "Are you sure you want to delete nodejs? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    sudo apt-get purge nodejs &&\
    sudo rm -r /etc/apt/sources.list.d/nodesource.list &&\
    sudo rm -r /etc/apt/keyrings/nodesource.gpg
fi
