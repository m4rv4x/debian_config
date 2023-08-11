# Check if Ruby package already exists
if dpkg -s ruby &> /dev/null; then
    echo "Ruby package already installed"
else
    # Install latest Ruby
    gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io -o ~/rvm.sh
    chmod +x ~/rvm.sh
    ./rvm/sh
    rm -r ~/rvm.sh
fi
