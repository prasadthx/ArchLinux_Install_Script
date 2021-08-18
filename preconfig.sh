#!/bin/bash


clear

echo "======================================================================"
echo "=========================== Partition Disk ==========================="
echo "======================================================================"

sleep 3

#Listing the available disks
lsblk

#Select the disk for partitioning:-
read -p "Select the disk for partition:- " DISK

if [ "${BIOS}"=="UEFI" ]; then
    sgdisk -Z $DISK
    sgdisk -a 2048 -o ${DISK}
    sgdisk -n 1:0:+500M ${DISK} # partition 1 => EFI Partition
    sgdisk -n 2:0:-2G ${DISK} # partition 2 => Root Partition
    sgdisk -n 3:0:0 ${DISK} # partition 3 => Swap Partition
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


#Getting partition Names
disks=`(fdisk -l) | (grep "^/dev") | (awk '{print $1}')`
partitionNames=()

while read -r line; do
   partitionNames+=("$line")
done <<< "$disks"


#Making the FileSystems
mkfs.vfat -F32 -n "EFI" "${partitionNames[0]}"
mkfs.ext4 -L "Root" "${partitionNames[1]}" -F
mkswap "${partitionNames[2]}"


#Mounting the disks
mkdir /mnt/boot
mkdir /mnt/boot/efi
mount ${partitionNames[1]} /mnt
mount ${partitionNames[0]} /mnt/boot/efi
swapon ${partitionNames[2]}

sleep 5

lsblk

echo "======================================================================"
echo "=====================Disk Partitioning Complete======================="
echo "======================================================================"

sleep 3


