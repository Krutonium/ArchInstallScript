#!/bin/bash
dd bs=512 count=500 if=/dev/zero of=/dev/sda
parted --script /dev/sda \
mklabel msdos \
mkpart primary ext4 0% 20GiB \
mkpart primary ext4 20GiB 100%

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2
