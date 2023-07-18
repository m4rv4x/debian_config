#!/bin/bash

storage="/hdd/"


echo "[-] REMOVING CONTAINERS AND VOLUMES"
   # Stop and remove all running containers
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker volume prune

echo "[!] DONE"
echo "[+] RUNNING NEW CONTAINERS"

   # Run each container with the appropriate command
   # docker run -d --name portainer_agent portainer/agent:2.18.4 
   #docker run -d --name transmission -p 86:9091 -p 51413:51413/udp -p 51413:51413/tcp linuxserver/transmission:latest
docker run -d --name netdata netdata/netdata:latest # PORT 19999
docker run -d --name OpenVPNas -p 943:943 -p 1194:1194/udp -p 9444:9443/tcp linuxserver/openvpn-as:latest
#docker run -d --name airsonic -p 81:4040 linuxserver/airsonic:latest
   #docker run -d --name fresh-rss -p 82:80 -p 8243:443 linuxserver/freshrss:latest
docker run -d --name grav -p 83:80 -p 32777:443 linuxserver/grav:latest
docker run -d --name dozzle -p 84:8080 --restart=unless-stopped --volume=/var/run/docker.sock:/var/run/docker.sock amir20/dozzle:latest 
docker run -d --name uptime-kuma -p 85:3001 louislam/uptime-kuma:1 
docker run -d --name portainer -p 8000:8000 -p 9443:9443 -p 9000:9000 --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
docker run -d --name heimdall -p 80:80 -p 8043:443 --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower heimdall
docker run -d --name metube -p 8081:8081 -v /path/to/downloads:/hdd/downloads ghcr.io/alexta69/metube
##################### TRANSMISSION TORRENT #####################
echo "[+] RUNNING NEW CONTAINER : TRANSMISSION"
docker run -d \
  --name=transmission \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e TRANSMISSION_WEB_HOME= `#optional` \
  -e USER= `#optional` \
  -e PASS= `#optional` \
  -e WHITELIST= `#optional` \
  -e PEERPORT= `#optional` \
  -e HOST_WHITELIST= `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /path/to/data:/hdd/config \
  -v /path/to/downloads:/hdd/downloads \
  -v /path/to/watch/folder:/hdd/transmission/watch \
  --restart unless-stopped \
  lscr.io/linuxserver/transmission:latest
######################################################################## FRESH RSS
echo "[+] RUNNING NEW CONTAINER : FRESHRSS"
docker run -d \
  --name=freshrss \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 82:80 \
  -v /path/to/data:/hdd/config \
  --restart unless-stopped \
  linuxserver/freshrss:latest
########################################################################
echo "[+] RUNNING NEW CONTAINER : AIRSONIC"
docker run -d \
  --name=airsonic \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 81:4040 \
  -v /path/to/config:/hdd/config \
  -v /path/to/music:/hdd/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/airsonic

echo "[!] DONE"
