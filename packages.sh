#!/bin/bash

clear

echo "======================================================================"
echo "=================== Installing essential packages ===================="
echo "======================================================================"
packages=(
      'bash-completion'             #Tab completion for Bash
      'neofetch'                    #Showing system info
      'openssh'                     #Network connectivity tool
      'tlp'                         #Power Management tool
      'zsh'                         #Z-shell
      'zsh-completions'             #Tab completion for zsh
      'dosfstools'                  #DOS Support
      'mtools'
      'networkmanager'              #Network support
      'network-manager-applet'
      'konsole'                     #KDE Terminal
      'linux-headers'
      'linux-lts-headers'
      'base-devel'
      'net-tools'
      'asp'
      'fakeroot'
      'binutils'
      'gcc'
      'make'
      'open-vm-tools'
      'git'

      #Display
      'xorg'              #Xorg display server
      'plasma'            #For kde plasma desktop environment
      'lightdm'           #Lightdm display manager
      'lightdm-webkit-theme-litarvan'    #Lightdm theme

      #Utilities
      'cups'              #Printer Support
      'bluez'             #Bluetooth Support
      'okular'            #PDF Support
      'elisa'             #Music Player
      'kamoso'            #Web Cam Application

      #Bootloader
      'grub'
      'efibootmgr'
      'os-prober'
)

for PKG in "${packages[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo "======================================================================"
echo "====================Package installation Complete====================="
echo "======================================================================"

sleep 2