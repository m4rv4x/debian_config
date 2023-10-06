# Verify if node is installed before trying to install
if dpkg -s docker-compose &> /dev/null; then
    echo "docker-compose is already installed"
else
    # Install latest docker-compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
    # Create a new user group named docker:
    sudo groupadd docker
    # Now, you can add the user to the docker user group with the usermod command:
    sudo usermod -aG docker $USER
    # Fix Perm for docker sock
    sudo chmod 666 /var/run/docker.sock
    sudo apt update && sudo apt install docker.io -y
fi


