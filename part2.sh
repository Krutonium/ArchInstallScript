#!/bin/bash
rm -rf /etc/localtime
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc
echo en_US.UTF-8 >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 UTF-8 >> /etc/locale.conf
echo KruArch >> /etc/hostname
mkinitcpio -p linux
echo ROOT PASSWORD:
passwd
echo USER PASSWORD:
useradd -m -g wheel -s /bin/bash krutonium
passwd krutonium
echo 'krutonium	ALL=(ALL:ALL) ALL' >> /etc/sudoers

pacman -S archlinux-keyring --noconfirm
pacman-key --init
pacman-key --populate archlinux

pacman -Syu intel-ucode grub os-prober --noconfirm
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S networkmanager gnome budgie-desktop archlinux-wallpaper network-manager-applet --noconfirm
systemctl enable gdm
systemctl enable NetworkManager

pacman -S git go --noconfirm

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

exit
