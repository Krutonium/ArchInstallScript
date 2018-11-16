#!/bin/bash

source /vars


echo ROOT PASSWORD:
passwd
echo USER PASSWORD:
passwd $username
useradd -m -g wheel -s /bin/bash $username
echo $username'	ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
#user can sudo without password. This is to make part3 work.
#Sets up the user early.

rm -rf /etc/localtime
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo KruArch >> /etc/hostname
mkinitcpio -p linux
#Bootable Save a Bootloader


pacman -S archlinux-keyring --noconfirm
pacman-key --init
pacman-key --populate archlinux

pacman -Syu intel-ucode grub os-prober --noconfirm
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S networkmanager gnome budgie-desktop archlinux-wallpaper --noconfirm
systemctl enable gdm
systemctl enable NetworkManager

#Now were ready to start with AUR packages.

pacman -S go --noconfirm

echo MAKEFLAGS="-j$(nproc)" >> /etc/makepkg.conf

#this is just to set up aur packages, since you can't do that as root.
sudo /part3.sh

exit

