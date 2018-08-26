# ArchInstallScript
A script to install Arch quickly.

Does what it says on the tin.

# FEATURES HARDCODED DEFAULTS. BEWARE.

`format.sh` will format /dev/sda without warning or prompting, first using dd to wipe the MBR and Partition table, then setting it up with parted.
It targets a 20% / and 80% /home layout. In future installs, simply skip this script and `mkfs.ext4 /dev/sda1`


`ArchInstallScript.sh` will do a standard setup of Arch, then pass control to part2.sh

`part2.sh` is run inside the arch chroot. Customize username here. You can also add additional packages here. 

`OfflineBase.sh` will use the install media to configure your base system, skipping downloading. YOU WILL HAVE OUT OF DATE PACKAGES.

`part2offline.sh` will do basically everything that it can without internet, that part2.sh would have done. This means that it CAN NOT install a bootloader, DE, etc.
It basically leaves you without a runable system, but does configure accounts and language files.


# Please feel free to open issues and make PR's to improve this code!

THESE SCRIPTS ARE NOT SAFE FOR CASUAL USE THEY FORMAT DRIVES AND REMOVE DATA. READ AND UNDERSTAND THEM BEFORE USE.
