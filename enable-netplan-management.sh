#!/bin/bash

echo "This script is created by Kaled Aljebur to enable Netplan"
echo "network managment in LinuxMint for teaching in my classes."
#Disable NetworkManager
echo "Disable NetworkManager..."
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager

#Enable systemd-networkd to manage networking
echo "Enabling systemd-networkd for network management..."
sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd

#Rename the available profile, unlike NetworManager, Netplan only working with .yaml, not .yml
sudo mv /etc/netplan/01-network-manager-all.yml /etc/netplan/01-network-manager-all.yaml

#Edit the Netplan YAML profile
echo "Create Netplan YAML progfile..."
sudo tee /etc/netplan/01-network-manager-all.yaml > /dev/null <<EOF
# Create by Kaled Aljebur as a sample and tested in VMware enviroment.
network:
  version: 2
  renderer: networkd
  ethernets:
    ens33:
      dhcp4: no
      addresses:
        - 192.168.8.30/24
      routes:
        - to: default
          via: 192.168.8.2
      nameservers:
        addresses: [192.168.8.2]
EOF

#Apply the Netplan profile
echo "Apply the Netplan profile..."
sudo netplan apply

#Pause to get the changes applied
echo "Waiting the changes to be applied..."
sleep 3

#List the new IP settings
echo "List the new IP settings..."
ip a sh ens33

