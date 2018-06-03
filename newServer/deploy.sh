#!/bin/bash

# Usage: ./deploy.sh [host]

host="${1:-ec2-user@ec2-35-177-84-198.eu-west-2.compute.amazonaws.com}"
#host="{1:-ec2-user@ec2-35-177-84-198.eu-west-2.compute.amazonaws.com}"

sudo rm chef.tar.gz
tar -zcvf chef.tar.gz .
scp chef.tar.gz "$host":
ssh -o 'StrictHostKeyChecking no' "$host" '
sudo rm -rf ~/chef &&
mkdir ~/chef &&
mv chef.tar.gz ~/chef &&
cd ~/chef &&
tar -xvzf chef.tar.gz &&
sudo bash install.sh'
