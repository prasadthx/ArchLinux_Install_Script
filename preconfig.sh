#!/bin/bash

#Sync Pacman Repository
pacman -Syy

#Listing the available disks
lsblk

#Select the disk for partitioning:-
read -p "Select the disk for partition:- " DISK

if [ $BIOS=="UEFI" ]; then
    sgdisk -Z $DISK
    sgdisk -a 2048 -o ${DISK}
    sgdisk -n 1:0:+500M ${DISK} # partition 1 => EFI Partition
    sgdisk -n 2:0:+2G ${DISK} # partition 2 => Swap Partition
    sgdisk -n 3:0:0 ${DISK} # partition 3 => Root Partition
    # set partition types
    sgdisk -t 1:ef00 ${DISK}
    sgdisk -t 2:8200 ${DISK}
    sgdisk -t 3:8300 $DISK
#elif [ $BIOS=="MBR"]; then
#    sfdisk -Z $DISK
fi

sgdisk -c 1:"EFI" ${DISK}
sgdisk -c 2:"Swap" ${DISK}
sgdisk -c 3:"Root" $DISK

mkfs.fat -F32 -n "EFI" "${DISK}1"
mkswap -L "Swap" "${DISK}2"
mkfs.ext4 -L "Root" "${DISK}3"




