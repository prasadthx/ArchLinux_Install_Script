#!/bin/bash

chmod +x declare.sh
chmod +x preconfig.sh
chmod +x install.sh
chmod +x postchroot.sh
chmod +x packages.sh
chmod +x aurpackages.sh

. ./declare.sh
. ./preconfig.sh
. ./install.sh

cp postchroot.sh /mnt/postchroot.sh
cp packages.sh /mnt/packages.sh
cp aurpackages.sh /mnt/aurpackages.sh

arch-chroot /mnt /bin/bash << EOF
. ./postchroot.sh
. ./packages.sh
. ./aurpackages.sh

mkinitcpio -p linux

grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi

grub-mkconfig -o /boot/grub/grub.cfg


systemctl enable NetworkManager
systemctl enable lightdm
systemctl enable cups
systemctl enable bluez

EOF

umount -a

reboot