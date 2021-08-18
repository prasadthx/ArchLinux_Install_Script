#!/bin/bash

source install.conf

echo "======================================================================"
echo "========================= Setting Up Rootfs =========================="
echo "======================================================================"

#Set the timezone
read -p "Enter your timezone in the format(Continent/Region) [Default => Asia/Kolkata]:-" TIMEZONE
TIMEZONE=${TIMEZONE:-"Asia/Kolkata"}
ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
hwclock --systohc


#Setting up the locale
sed -i "s/^#${LANGUAGE}/${LANGUAGE}/" /etc/locale.gen
locale-gen
echo "en_IN.UTF-8" > /etc/locale.conf


#Setting up Hostname
echo $HOSTNAME > /etc/hostname


#Setting up network configuration
echo "
127.0.0.1       localhost
::1             localhost
127.0.0.1       ${HOSTNAME}.localdomain ${HOSTNAME}
" > /etc/hosts

#
#Setting Passwords
echo "root:${PASSWORD}" | chpasswd
useradd -mG wheel ${USERNAME}
echo "${USERNAME}:${PASSWORD}" | chpasswd
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers


echo "======================================================================"
echo "======================= Setting Up Complete =========================="
echo "======================================================================"