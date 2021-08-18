#! /bin/bash

clear

echo "======================================================================"
echo "====================== Setting Up Arch Linux ========================="
echo "======================================================================"

sleep 2

#Sync the pacman repository
pacman -Syy

#Install Arch Linux essentials
pacstrap /mnt base linux linux-lts linux-firmware vim --noconfirm --needed


#Generating fstab file
genfstab -U /mnt >> /mnt/etc/fstab


echo "======================================================================"
echo "======================= Changing to rootfs ==========================="
echo "======================================================================"

sleep 2