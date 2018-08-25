#!/bin/bash
rm -rf /etc/localtime
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
sed -i '/en_US.UTF8/s/^#//g' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo KruArch >> /etc/hostname
mkinitcpio -p linux
passwd
useradd -m -g wheel -s /bin/zsh krutonium
passwd krutonium
echo 'krutonium	ALL=(ALL:ALL) ALL' >> /etc/sudoers
pacman -Syu intel-ucode grub2
grub-install --target=i386-pc /dev/sda
exit
