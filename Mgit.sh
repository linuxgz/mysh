#!/bin/bash

# To make a git from local to remote

# Set git workplace
mkdir -p ~/Github/mysh

# 1 git init the place.

cd ~/Github/ && git init

# 2 config user and email
git config --global user.name linuxgz
git config --global user.email linuxgz@163.com

# 3 ssh key
ssh-keygen -t rsa -C linuxgz@163.com

ll ~/.ssh/
echo "now cp ~/.ssh/*id_rsa.pub , web github to add the key"


echo "Then cmd to test: ssh -T git@github.com"

