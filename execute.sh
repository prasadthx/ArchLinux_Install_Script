#!/bin/bash

chmod +x declare.sh
#chmod +x preconfig.sh
#chmod +x install.sh
chmod +x postchroot.sh
chmod +x packages.sh
chmod +x aurpackages.sh

. ./declare.sh
#. ./preconfig.sh
#. ./install.sh

cp postchroot.sh /mnt/postchroot.sh
cp packages.sh /mnt/packages.sh
cp aurpackages.sh /mnt/aurpackages.sh
cp execute.sh /mnt/execute.sh

arch-chroot /mnt ./postchroot.sh

umount -a

reboot