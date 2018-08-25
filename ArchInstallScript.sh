#!/bin/bash
#Were installing Arch today boys!

pacman -Sy

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda2 /mnt/home
pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab

cp ./part2.sh ./mnt/part2.sh
chmod +x /mnt/part2.sh

arch-chroot /mnt /part2.sh


