#! /bin/bash

#Sync the pacman repository
pacman -Syy

#Install Arch Linux essentials
pacstrap /mnt base linux linux-lts linux-firmware vim --noconfirm --needed


#Generating fstab file
genfstab -U /mnt >> /mnt/etc/fstab


#Changing the root to new system:-
arch-chroot /mnt


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
passwd