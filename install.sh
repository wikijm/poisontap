#!/bin/bash
apt update && apt upgrade -y

echo -e "\nauto usb0\nallow-hotplug usb0\niface usb0 inet static\n\taddress 1.0.0.1\n\tnetmask 0.0.0.0" >> /etc/network/interfaces
echo "dtoverlay=dwc2" >> /boot/config.txt
echo -e "dwc2\ng_ether" >> /etc/modules
echo "/bin/sh /home/pi/poisontap/pi_startup.sh" >> /etc/rc.local
mkdir /home/pi/poisontap
chown -R pi /home/pi/poisontap
apt-get update && apt-get upgrade
apt-get -y install isc-dhcp-server dsniff screen nodejs
