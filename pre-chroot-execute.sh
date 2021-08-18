#!/bin/bash

chmod +x declare.sh
chmod +x preconfig.sh
chmod +x install.sh
chmod +x post-chroot-execute.sh
chmod +x packages.sh
chmod +x aurpackages.sh
chmod +x rootfs-setup.sh

. ./declare.sh
. ./preconfig.sh
. ./install.sh

cp post-chroot-execute.sh /mnt/post-chroot-execute.sh
cp rootfs-setup.sh /mnt/rootfs-setup.sh
cp packages.sh /mnt/packages.sh
cp aurpackages.sh /mnt/aurpackages.sh
cp install.conf /mnt/install.conf

arch-chroot /mnt ./postchroot.sh

umount -a

