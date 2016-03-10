#!/bin/bash
#1 Install NTP service
yum install -y  chrony
if [ "$HOSTNAME" = "foo" ]; then

else
  sed -i '20,23d' /etc/chrony/chrony.conf
  sed -i '20 a server controller iburst' /etc/chrony/chrony.conf
fi

systemctl enable chronyd.service
systemctl start chronyd.service 

#2 Enable OpenStack Repository
apt-get update && apt-get dist-upgrade -y
apt-get install software-properties-common
yes '' | add-apt-repository cloud-archive:liberty
apt-get update && apt-get dist-upgrade -y
reboot
