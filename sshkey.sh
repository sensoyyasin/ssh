#!/bin/bash

RANDOM_NUMBER=$((RANDOM % 9000 + 1000))
USERNAME="sshuser$RANDOM_NUMBER"
PASSWORD="123"
SSH_KEY_PATH="/home/$USERNAME/.ssh/rsa_SSHKey"
# REMOTE_HOST="**.**.**.**" -> select your remote_host

sudo useradd -m -s /bin/bash "$USERNAME"

echo "$USERNAME:$PASSWORD" | sudo chpasswd

sudo chage -m 0 -M 9999 "$USERNAME"

sudo -u "$USERNAME" mkdir -p /home/$USERNAME/.ssh
sudo -u "$USERNAME" chmod 700 /home/$USERNAME/.ssh
sudo -u "$USERNAME" ssh-keygen -t rsa -m pem -f "$SSH_KEY_PATH" -N ""
sudo -u "$USERNAME" ssh-copy-id -i "$SSH_KEY_PATH.pub" "$USERNAME@$REMOTE_HOST"
sudo -u "$USERNAME" ls -l /home/$USERNAME/.ssh
sudo -u "$USERNAME" cat "$SSH_KEY_PATH"
