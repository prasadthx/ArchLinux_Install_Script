#!/bin/bash

echo "======================================================================"
echo "====================== Installing AUR packages ======================="
echo "======================================================================"

aurpackages=(
      'kmplayer-git-master'
      'coreimage'
      'deepin-file-manager-git'
      'google-chrome'
      'xdman'
)


git clone "https://aur.archlinux.org/yay.git"

cd ${HOME}/yay
makepkg -si

for PKG in "${aurpackages[@]}"; do
    yay -S --noconfirm $PKG
done

echo "======================================================================"
echo "=================== Package Installation Complete ===================="
echo "======================================================================"

