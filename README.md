# The issue:
LinuxMint is much lightwight comparing with Ubuntu Desktop, thus it is more suitable for virtualisation.
Netplan is already available in LinuxMint but it is not managing the network.
The first script will disable NetworManager and enable managing the networking using Netplan.
Another script available to reverse the work and back to default.

Please let me know if you have any questions.

Regards, 
Kaled Aljebur.

# Steps to enable Netplan and disable NetworkManager:
Note: the following steps are very basic and they are for learning purposes.
- Get the script:
    - Using Git, use the following steps in the Terminal:
        - Update APT and install Git `sudo apt update && sudo apt install git`.
        - Move to the Desktop `cd Desktop`.
        - Clone the repository using `git clone https://github.com/kaledaljebur/enable-netplan-management.git`.
        - Move to the repository folder `cd enable-netplan-managemen`.
        - Add excution permission `chmod u+x enable-netplan-management.sh`.
        - Execute the script using `sudo ./enable-netplan-management.sh`.
    - Or, just download the file [`enable-netplan-management.sh`](https://github.com/kaledaljebur/enable-netplan-management/blob/main/enable-netplan-management.sh). The use the following steps in the Terminal:
        - Move to the Downloads folder `cd ~/Downloads`.
        - Add execution permission `chmod u+x enable-netplan-management.sh`.
        - Execute the script using `sudo ./enable-netplan-management.sh`.
- After the execution, you should see some warnings but nit errors.
- The machine IP can be `192.168.8.30/24` if you remove the hashes in Netplan profile file.
- You can do the following to apply any update:
    - sudo nano `/etc/netplan/01-network-manager-all.yaml`.
    - Update the Yaml file, then apply using `sudo netplan apply` or use `sudo netplan try` to check the errors before applying.
- The script will set a static IP, if DHCP IP also needed then just use `sudo dhclient`.
- Use `sudo netplan apply` each time you see no static IP in `ip a`.
- It could be another Yaml files as network profiles in `/etc/netplan/` if more update is needed. 

# Steps to disable Netplan and enable NetworkManager (back to default):
- Get the script:
    - Using the same Git folder, use the following steps in the Terminal:
        - Make sure you are in `cd ~/Desktop/enable-netplan-managemen`.
        - Add excution permission `chmod u+x disable-netplan-management.sh`.
        - Execute the script using `sudo ./disable-netplan-management.sh`.
    - Or, just download the file [`disable-netplan-management.sh`](https://github.com/kaledaljebur/enable-netplan-management/blob/main/disable-netplan-management.sh). Then use the following steps in the Terminal:
        - Move to the Downloads folder `cd ~/Downloads`.
        - Add execution permission `chmod u+x disable-netplan-management.sh`.
        - Execute the script using `sudo ./disable-netplan-management.sh`.

# Outcomes:
- How to install Git client in your Linux machine, it is a basic activity on how to clone git projects.
- How to enable and disable Netplan networking management.
- How to manually set the Netplan profile.