#!/bin/bash

sudo mount /dev/nvme0n1p8 /mnt/gentoo

sudo cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
sudo mount --types proc /proc /mnt/gentoo/proc
sudo mount --rbind /sys /mnt/gentoo/sys
sudo mount --make-rslave /mnt/gentoo/sys
sudo mount --rbind /dev /mnt/gentoo/dev
sudo mount --make-rslave /mnt/gentoo/dev
sudo mount --bind /run /mnt/gentoo/run
sudo mount --make-slave /mnt/gentoo/run 

sudo chroot /mnt/gentoo /bin/bash -c "
source /etc/profile
export PS1=\"(chroot) \${PS1}\"
echo \"Entered into gentoo\"
fastfetch
export TERM=xterm
mount /dev/nvme0n1p7 /boot
exec /bin/bash
"
