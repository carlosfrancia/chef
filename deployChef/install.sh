#!/bin/bash

chef_binary=/usr/bin/chef-solo

if ! test -f "$chef_binary"; then
    sudo yum install -y wget &&
    wget https://packages.chef.io/files/stable/chefdk/3.0.36/el/7/chefdk-3.0.36-1.el7.x86_64.rpm &&
    sudo rpm -Uvh chefdk-3.0.36-1.el7.x86_64.rpm
fi &&

"$chef_binary" -c solo.rb -j solo.json
    
