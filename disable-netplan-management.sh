#!/bin/bash

echo "This script is created by Kaled Aljebur to disable Netplan"
echo "network managment in LinuxMint for teaching in my classes."

#Disable systemd-networkd to manage networking
echo "Enabling systemd-networkd for network management..."
sudo systemctl stop systemd-networkd
sudo systemctl disable systemd-networkd

#Enable NetworkManager
echo "Disable NetworkManager..."
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager


#Rename back the available profile, unlike Netplan, NetworManager only working with .yml, not .yaml
sudo mv /etc/netplan/01-network-manager-all.yaml /etc/netplan/01-network-manager-all.yml

#Edit the Netplan YAML profile, but it will not impact NetworkManager
echo "Create Netplan YAML progfile..."
sudo tee /etc/netplan/01-network-manager-all.yml > /dev/null <<EOF
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

#Ask for DHCP IP
sudo dhclient

#List the new IP settings
echo "List the new IP settings..."
ip a sh ens33

