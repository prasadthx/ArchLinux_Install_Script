#! /bin/bash


echo '
-------------------------------------------------------------------------------
        ____                   _             _                         __    __
       / /\ \     ___    ___  | |___        | |     _    ___    _   _  \ \  / /
      / /__\ \   |  _|  / __| |  __ \       | |    (_)  / _ \  | | | |  \ \/ /
     / ______ \  | |   | |__  | |  \ \      | |__  | | | | | | | |_| |  / /\ \
    / /      \ \ |_|    \___| | |  | |      |____| |_| |_| |_|  \___/  /_/  \_\

     Arch Linux Install Setup and Config
-------------------------------------------------------------------------------
'

#Set Up System Name:
read -p "Enter Host Name [Default => ArchLinux]: " HOSTNAME
HOSTNAME=${HOSTNAME:-"ArchLinux"}

#Set Up UserName:
read -p "Enter User Name [Default => archuser]: " USERNAME
USERNAME=${USERNAME:-"archuser"}

#Set Up Password:-
read -p "Enter Host Name [Default => Arch1234]: " PASSWORD
PASSWORD=${PASSWORD:-"Arch1234"}

#Set Up Language:-
read -p "Enter Host Name [Default => en_IN.UTF-8]: " LANGUAGE
LANGUAGE=${LANGUAGE:-"en_IN.UTF-8"}

#Set Up Boot Type:-
read -p "Enter Boot Type UEFI/BIOS: " BOOT
BOOT=${BOOT:-"UEFI"}

printf "HOSTNAME="$HOSTNAME"\n" >> "install.conf"
printf "USERNAME="$USERNAME"\n" >> "install.conf"
printf "PASSWORD="$PASSWORD"\n" >> "install.conf"
printf "LANGUAGE="$LANGUAGE"\n" >> "install.conf"
sleep 3