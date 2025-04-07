# The issue:
LinuxMint is much lightwight comparing with Ubuntu Desktop, thus it is more suitable for virtualisation.
NetPlan is already available in LinuxMint but it is not managing the network.
This script will disable NetworManager and enable managing the networking using NetPlan.

# Steps:
Note: the following steps are very basic and they are for learning purposes.
- Using Git
    - Update APT and install Git `sudo apt update && sudo apt install git`.
    - Move to the Desktop `cd Desktop`.
    - Clone the repository using `git clone https://github.com/kaledaljebur/enable-netplan-management.git`.
    - Move to the repository folder `cd enable-netplan-managemen`.
    - Add excution permission `chmod u+x enable-netplan-management.sh`.
    - Excute the script using `sudo ./enable-netplan-management.sh`.
- Or, just download the file [`enable-netplan-management.sh`](https://github.com/kaledaljebur/enable-netplan-management/blob/main/enable-netplan-management.sh).
- The script will set a static IP, if DHCP IP also needed then just use `sudo dhclient`.
- Use `sudo netplan apply` each time you see no static IP in `ip a`.
- The Yaml network profile file will be in `/etc/netplan/` if more update is needed. 
