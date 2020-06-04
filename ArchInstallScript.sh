#!/bin/bash
#Were installing Arch today boys!

source vars

pacman -Sy

mount /dev/sda1 /mnt
pacstrap /mnt base base-devel linux-zen linux-firmware 
genfstab -U /mnt >> /mnt/etc/fstab

cp ./part2.sh /mnt/part2.sh
cp ./vars /mnt/vars
chmod +x /mnt/part2.sh
cp ./part3.sh /mnt/part3.sh
chmod +x /mnt/part3.sh


arch-chroot /mnt /part2.sh

rm /mnt/part2.sh
rm /mnt/part3.sh
rm /mnt/vars

clear
echo =====================
echo   Install Complete!
echo =====================
echo
echo This Installer written by Krutonium
echo for his own personal use.
