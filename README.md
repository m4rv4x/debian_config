## Debian Apps & Custom Configuration
### Including
- Dev Packages
- CLI apps
- custom ZSH
- some aliases


### Add your user to sudo on fresh debian (as ROOT)
```
echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

### Install Script  
```
./setup.sh
```

### Docker Deploy

`nano docker-deploy.sh`

```
storage="/path/to/volume"
```

### Works on
- Debian 11
- Debian 12
- Kali
