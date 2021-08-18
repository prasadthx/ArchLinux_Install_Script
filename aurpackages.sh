#!/bin/bash

source install.conf

echo "======================================================================"
echo "====================== Installing AUR packages ======================="
echo "======================================================================"

aurpackages=(
       'coreimage'
       'google-chrome'
       'xdman'
)


git clone "https://aur.archlinux.org/yay.git"

chown -R ${USERNAME}:users ./yay

#Building the yay package
su -c 'cd yay && makepkg -si --noconfirm && cd ..' ${USERNAME}

#Download AUR Packages
for PKG in "${aurpackages[@]}"; do
    sudo -c ${USERNAME} yay -S --noconfirm $PKG
done

echo "======================================================================"
echo "=================== Package Installation Complete ===================="
echo "======================================================================"


