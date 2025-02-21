#!/bin/bash

USERNAME="sshdeneme"
#REMOTE_HOST="**.**.**.**"
#PASSWORD="**"

if sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 "$USERNAME@$REMOTE_HOST"; then
    echo "$USERNAME success!"
else
    echo "$USERNAME fail!"
fi
