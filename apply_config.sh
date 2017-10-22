#!/bin/bash
DIR=$(pwd)
echo $DIR

# Dirs
if [ ! -d ~/linux_config ]; then
    sudo ln -snf $DIR ~/linux_config
fi
sudo ln -snf $DIR/bin ~/bin

# Bash
sudo ln -snf $DIR/.bashrc ~/.bashrc
sudo ln -snf $DIR/.bash_profile ~/.bash_profile

# Git
sudo ln -snf $DIR/git/.gitconfig ~/.gitconfig
sudo ln -snf $DIR/git/.gitignore_global ~/.gitignore_global

# FONTS
sudo ln -snf $DIR/.fonts ~/.fonts
sudo ln -snf $DIR/fontconfig ~/.config/fontconfig

# fstab
if [ $(grep "fstab_add.txt" /etc/fstab | wc -l) -eq 0 ]; then
    sudo chmod 666 /etc/fstab
    sudo cat fstab_add.txt >> /etc/fstab
    sudo chmod 644 /etc/fstab
    echo
    cat /etc/fstab
    echo

    sudo mount -a
fi

#Command to check current swappiness value: 
cat /proc/sys/vm/swappiness

#Command to change swappiness value to 10:
sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf"

# VIM
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get install -y neovim xclip
#sudo apt-get install -y python-neovim
#sudo apt-get install -y python3-neovim
sudo ln -snf $DIR/vim  ~/.config/nvim
sudo ln -snf $DIR/vim  ~/.vim
sudo ln -snf $DIR/vim/init.vim  ~/.vimrc

# DC++
sudo apt-get install -y linuxdcpp
sourceDir=$DIR/dc++/
cd $sourceDir
for f in *; do sudo ln -snf $sourceDir$f ~/.dc++/$f ; done
cd $DIR

# OpenSSH
sudo apt-get install -y openssh-client
sudo apt-get install -y openssh-server
sudo apt-get install -y openssh-sftp-server

# Fossil
sudo apt-get install -y fossil

# Alsa
sudo apt-get install -y alsa-utils

# Pulse Audio
sudo apt-get install -y pulseaudio-utils

# Transmission
sudo apt-get install -y transmission-gtk

# Terminator
sudo apt-get install -y terminator

# mcomix
sudo apt-get install -y mcomix

# Spotify
sudo apt-get install -y spotify-client

# Google Chrome
sudo apt-get install -y google-chrome-stable

# SSH
if [ ! -f /etc/ssh/sshd_config ] || [ $(grep 'Port' /etc/ssh/sshd_config | cut -d' ' -f2) -ne 16080 ]; then
    cd /etc/ssh/
    sudo apt-get install -y openssh-client
    sudo apt-get install -y openssh-server
    sudo apt-get install -y openssh-sftp-server

    sudo update-rc.d -f ssh remove
    sudo update-rc.d -f ssh default

    sudo mkdir -p OLDKEYS
    sudo mv ssh_host_* OLDKEYS

    sudo dpkg-reconfigure openssh-server

    port=$(grep 'Port' sshd_config | cut -d' ' -f2)

    sudo touch sshd_config_new
    sudo chmod 666 sshd_config_new
    sudo sed "s/Port ${port}/Port 16080/" sshd_config > sshd_config_new
    sudo chmod 644 sshd_config_new
    sudo cp -f sshd_config_new sshd_config
    sudo rm -f sshd_config_new
    port=$(grep 'Port' sshd_config | cut -d' ' -f2)

    sudo systemctl restart ssh
fi

sudo systemctl status ssh
cd $DIR

