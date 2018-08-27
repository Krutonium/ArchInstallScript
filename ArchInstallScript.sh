#!/bin/bash
#Were installing Arch today boys!

source vars

pacman -Sy

mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda2 /mnt/home
pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab

cp ./part2.sh /mnt/part2.sh
chmod +x /mnt/part2.sh

arch-chroot /mnt /part2.sh

rm /mnt/part2.sh
rm /mnt/vars

clear
echo =====================
echo   Install Complete!
echo =====================
echo
echo This Installer written by Krutonium
echo for his own personal use.
