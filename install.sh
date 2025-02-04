#!/usr/bin/env bash

# install configs
sudo cp *.nix /etc/nixos/

# get current host
host=$(hostname)

# change server configs
if [ $host == 'blair-server' ]
then
   sudo sed -i 's|#./server|./server|g' /etc/nixos/configuration.nix
   sudo sed -i 's/blair-laptop/blair-server/g' /etc/nixos/configuration.nix
fi


# install nix_build
mkdir /home/blair/bin
cp yay /home/blair/bin

