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
read -p "Enter User Name [Default => archuser]: " HOSTNAME
HOSTNAME=${HOSTNAME:-"archuser"}

#Set Up Password:-
read -p "Enter Host Name [Default => Arch1234]: " HOSTNAME
HOSTNAME=${HOSTNAME:-"Arch1234"}

#Set Up Language:-
read -p "Enter Host Name [Default => en_IN.UTF-8]: " HOSTNAME
HOSTNAME=${HOSTNAME:-"en_IN.UTF-8"}

