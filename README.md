# On First install sudo ? (or not)

## Install sudo and add SUDOERS
Login as root :
```
su  # enter root password
```
install sudo and add sudoers
```
apt install sudo
echo "${USER} ALL=(ALL:ALL) ALL" > /etc/sudoers.d/$USER
exit
```
Done !  Go back to normal user
```exit```


## Debian Server Install

```
./setup-server.sh
```


## Debian X11 Install

(best is yet to come)