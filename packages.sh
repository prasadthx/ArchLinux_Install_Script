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
      'mtools'                      #Utilities for MS DOS disks
      'networkmanager'              #Network support
      'network-manager-applet'      #App for managing network connections
      'konsole'                     #KDE Terminal
      'linux-headers'               #Headers and scripts for building modules for the Linux kernel
      'linux-lts-headers'           #Headers and scripts for building modules for the Linux LTS kernel
      'base-devel'                  #Tools needed for building (compiling and linking)
      'net-tools'                   #Configuration tools for Linux networking
      'asp'                         #Tool to manage the build source files used to create Arch Linux packages
      'fakeroot'                    #Tool for simulating superuser privileges
      'binutils'                    #A set of programs to assemble and manipulate binary and object files
      'gcc'                         #The GNU Compiler Collection - C and C++ frontends
      'make'                        #GNU make utility to maintain groups of programs
      'open-vm-tools'               #VMware Workstation tools
      'git'                         #Git support for arch linux

      #Display
      'xorg'                             #Xorg display server
      'plasma'                           #For kde plasma desktop environment
      'lightdm'                          #Lightdm display manager
      'lightdm-webkit-theme-litarvan'    #Lightdm Litarvan's theme

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
    pacman -S "$PKG" --noconfirm --needed
done

echo "======================================================================"
echo "====================Package installation Complete====================="
echo "======================================================================"

sleep 2