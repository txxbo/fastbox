#!/bin/bash

if [ $# -eq 0 ]
    then
        echo -n "Username: "
        read user
        username=$user
else
    username=$1
fi

echo "Adding sudo user, $username"
adduser $username --gecos '' --disabled-password
usermod -aG sudo $username
echo "%sudo ALL=(ALL)   NOPASSWD: ALL" >> /etc/sudoers

echo "Creating credentials for SSH access"
rsync --archive --chown=$username:$username ~/.ssh /home/$username

echo "Setting up firewall rules for SSH"
ufw allow OpenSSH
ufw --force enable