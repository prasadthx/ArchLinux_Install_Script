#!/bin/bash

echo "======================================================================"
echo "=========================== Partition Disk ==========================="
echo "======================================================================"

#Listing the available disks
lsblk

#Select the disk for partitioning:-
read -p "Select the disk for partition:- " DISK

if [ "${BIOS}"=="UEFI" ]; then
    sgdisk -Z $DISK
    sgdisk -a 2048 -o ${DISK}
    sgdisk -n 1:0:+500M ${DISK} # partition 1 => EFI Partition
    sgdisk -n 2:0:-2G ${DISK} # partition 2 => Root Partition
    sgdisk -n 3:0:+2G ${DISK} # partition 3 => Swap Partition
    # set partition types
    sgdisk -t 1:ef00 ${DISK}
    sgdisk -t 2:8300 ${DISK}
    sgdisk -t 3:8200 ${DISK}
    #elif [ $BIOS=="MBR"]; then
#    sfdisk -Z $DISK
fi

#Labelling the Partitions
sgdisk -c 1:"EFI" ${DISK}
sgdisk -c 2:"Root" ${DISK}
sgdisk -c 3:"Swap" $DISK


#Making the FileSystems
mkfs.vfat -F32 -n "EFI" "${DISK}1"
mkfs.ext4 -L "Root" "${DISK}2"
mkswap -L "Swap" "${DISK}3"


#Mounting the disks
mkdir -p /mnt/boot/efi
mount "${DISK}2" /mnt
mount "${DISK}1" /mnt/boot/efi
swapon "${DISK}3"

lsblk

echo "======================================================================"
echo "=====================Disk Partitioning Complete======================="
echo "======================================================================"


