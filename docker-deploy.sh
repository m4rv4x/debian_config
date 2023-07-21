#!/bin/bash
storage="/hdd"
# Ask the user for input to confirm removing containers
read -p "[?] Do you want to remove all running containers and volumes? (yes/NO): " choice

if [[ $choice == "yes" || $choice == "y" || $choice == "Y" || $choice == "YES" ]]; then
   # Stop and remove all running containers
   echo "[-] REMOVING CONTAINERS AND VOLUMES"
   docker stop $(docker ps -aq)
   docker rm $(docker ps -aq)
   docker volume prune
else
   echo "[!] NOT REMOVING ANYTHING"
fi
echo "[+] RUNNING NEW CONTAINER : PORTAINER"
docker run -d --name portainer \
   -p 8000:8000 -p 9443:9443 -p 9000:9000 \
   --restart=unless-stopped \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v portainer_data:/data portainer/portainer-ce:latest
########################################################################
echo "[+] RUNNING NEW CONTAINER : NETDATA"
docker run -d --name=netdata \
   -p 19999:19999 \
   -v /proc:/host/proc:ro \
   -v /sys:/host/sys:ro \
   -v /var/run/docker.sock:/var/run/docker.sock \
   --security-opt apparmor=unconfined \
   netdata/netdata
########################################################################
echo "[+] RUNNING NEW CONTAINER : OPENVPN AS"
docker run -d --name OpenVPNas -p 943:943 -p 1194:1194/udp -p 9444:9443/tcp \
   --restart=unless-stopped \
   linuxserver/openvpn-as:latest
#docker run -d --name airsonic -p 81:4040 linuxserver/airsonic:latest
   #docker run -d --name fresh-rss -p 82:80 -p 8243:443 linuxserver/freshrss:latest
echo "[+] RUNNING NEW CONTAINER : GRAV BLOG"
docker run -d --name grav -p 83:80 -p 32777:443 linuxserver/grav:latest
########################################################################
echo "[+] RUNNING NEW CONTAINER : DOZZLE"
docker run -d --name dozzle -p 84:8080 \
   --restart=unless-stopped \
   --volume=/var/run/docker.sock:/var/run/docker.sock \
   amir20/dozzle:latest 
########################################################################
echo "[+] RUNNING NEW CONTAINER : UPTIME KUMA"
docker run -d --name uptime-kuma -p 85:3001 louislam/uptime-kuma:1 
########################################################################
echo "[+] RUNNING NEW CONTAINER : HEIMDAL"
docker run -d --name heimdall -p 80:80 -p 8043:443 \
   --restart=unless-stopped \
   -v /var/run/docker.sock:/var/run/docker.sock \
   linuxserver/heimdall heimdall
########################################################################
echo "[+] RUNNING NEW CONTAINER : METUBE"
docker run -d --name=metube -p 8081:8081 -v ${storage}/downloads:/downloads ghcr.io/alexta69/metube:latest
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
  -v ${storage}/config:/config \
  -v ${storage}/downloads:/downloads \
  -v ${storage}/watch:/watch \
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
  -v ${storage}/config:/config \
  --restart unless-stopped \
  linuxserver/freshrss:latest
########################################################################
echo "[+] RUNNING NEW CONTAINER : AIRSONIC"
docker run -d \
  --name=airsonic \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 81:4040 \
  -v ${storage}/config:/config \
  -v ${storage}/downloads:/music \
  --restart unless-stopped \
  lscr.io/linuxserver/airsonic
##################################################################################
echo "[+] RUNNING NEW CONTAINER : GUACAMOLE"
docker run -d \
  --name=guacamole \
  -p 86:8080 \
  -v ${storage}/config:/config \
  --restart unless-stopped \
  oznu/guacamole

echo "[!] DONE"

