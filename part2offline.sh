#!/bin/bash
rm -rf /etc/localtime
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo KruArch >> /etc/hostname
mkinitcpio -p linux
echo ROOT PASSWORD:
passwd
echo USER PASSWORD:
useradd -m -g wheel -s /bin/bash krutonium
passwd krutonium
echo 'krutonium ALL=(ALL:ALL) ALL' >> /etc/sudoers

#At this point i've hit a roadblock. Without internet, there is no way to set up a bootloader.
#Help Appreciated!
