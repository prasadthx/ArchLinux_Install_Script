#!/bin/bash

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
su - ${USERNAME}

#Building the yay package
cd /yay
makepkg -si

for PKG in "${aurpackages[@]}"; do
    yay -S --noconfirm $PKG
done

echo "======================================================================"
echo "=================== Package Installation Complete ===================="
echo "======================================================================"

cd ..
exit
sleep 2
