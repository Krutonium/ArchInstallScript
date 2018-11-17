#!/bin/bash
BUILDDIR=~/BUILD
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rd ~/BUILD
#now we have yay installed.

yay -S pamac-aur discord budgie-network-applet openrct2 telegram-desktop --noconfirm

exit
