#!/bin/bash

. ./declare.sh
. ./preconfig.sh
. ./install.sh
. ./packages.sh
. ./aurpackages.sh

mkinitcpio -p linux linux-lts

grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi

grub-mkconfig -o /boot/grub/grub.cfg


systemctl enable NetworkManager
systemctl enable lightdm
systemctl enable cups
systemctl enable bluez

exit

umount -a

reboot