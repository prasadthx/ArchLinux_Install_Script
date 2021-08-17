#!/bin/bash


#Set the timezone
read -p "Enter your timezone in the format(Continent/Region) [Default => Asia/Kolkata]:-" TIMEZONE
timedatactl set-timezone ${TIMEZONE}
hwclock --systohc


#Setting up the locale
sed -i "s/^#${LANGUAGE}/${LANGUAGE}/" /etc/locale.gen
locale-gen
localectl set-locale LANG=${LANGUAGE}


#Setting up Hostname
hostnamectl set-hostname ${HOSTNAME}


#Setting up network configuration
echo "
127.0.0.1       localhost
::1             localhost
127.0.0.1       ${HOSTNAME}.localdomain ${HOSTNAME}
" > /etc/hosts


#Setting Passwords
echo "root:${PASSWORD}" | chpasswd
useradd -aG wheel ${USERNAME}
echo "${USERNAME}:${PASSWORD}" | chpasswd
sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

echo "======================================================================"
echo "======================= Setting Up Complete =========================="
echo "======================================================================"

sleep 3

. ./packages.sh
. ./aurpackages.sh

mkinitcpio -p linux

grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi

grub-mkconfig -o /boot/grub/grub.cfg


systemctl enable NetworkManager
systemctl enable lightdm
systemctl enable cups
systemctl enable bluez

exit

reboot