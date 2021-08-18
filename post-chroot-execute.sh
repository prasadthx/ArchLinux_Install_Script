#!/bin/bash

source install.conf

sleep 3
#Installing packages
. ./rootfs-setup.sh
. ./packages.sh
. ./aurpackages.sh
#
mkinitcpio -p linux linux-lts

grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi

grub-mkconfig -o /boot/grub/grub.cfg


systemctl enable NetworkManager
systemctl enable lightdm
systemctl enable cups
systemctl enable bluez
systemctl enable vmtoolsd.service
systemctl enable vmware-vmblock-fuse.service

sed -i 's/^#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/' /etc/lightdm/lightdm.conf
sed -i '/webkit_theme=litarvan/c\webkit_theme=litarvan' /etc/lightdm/lightdm-webkit2-greeter.conf

exit

reboot