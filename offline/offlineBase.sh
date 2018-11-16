#!/bin/bash
#Were installing Arch offline today boys!

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda1 /mnt
mount /dev/sda2 /mnt/home

cp -ax / /mnt
cp -vaT /run/archiso/bootmnt/arch/boot/$(uname -m)/vmlinuz /mnt/boot/vmlinuz-linux

rm -rf /mnt/etc/fstab
genfstab -U /mnt >> /mnt/etc/fstab

sed -i 's/Storage=volatile/#Storage=auto/' /mnt/etc/systemd/journald.conf
rm /mnt/etc/udev/rules.d/81-dhcpcd.rules

rm -r /mnt/etc/systemd/system/{choose-mirror.service,pacman-init.service,etc-pacman.d-gnupg.mount,getty@tty1.service.d}
rm /mnt/etc/systemd/scripts/choose-mirror

rm /mnt/etc/systemd/system/getty@tty1.service.d/autologin.conf
rm /mnt/root/{.automated_script.sh,.zlogin}
rm /mnt/etc/mkinitcpio-archiso.conf
rm -r /mnt/etc/initcpio

cp ./part2offline.sh /mnt/part2.sh
