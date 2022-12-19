#!/usr/bin/env bash

clear; echo "Requesting SUDO..."; sudo echo "SUDO Granted!"; sleep 1
clear

echo "Creating ZPOOLS on Specified Disks..."; sleep 1
sudo zpool create -O compression=on -O dedup=off ZDISK1 /dev/disk/by-id/ata-Samsung_SSD_870_EVO_1TB_S6PTNZ0T400190K
sudo zpool create -O compression=on -O dedup=off ZDISK2 /dev/disk/by-id/ata-Samsung_SSD_860_EVO_1TB_S59VNS0N829867X
sudo zpool create -O compression=on -O dedup=off ZDISK3 /dev/disk/by-id/ata-CT1000BX500SSD1_2022E2A713DE
sudo zpool create -o ashift=12 -O compression=on -O dedup=off ZDISK4 /dev/disk/by-id/ata-ST2000LM015-2E8174_ZDZ98TA7
sudo zpool create -o ashift=12 -O compression=on -O dedup=off ZDISK5 /dev/disk/by-id/ata-HGST_HUS726T6TALE6L4_V9JX17RL
clear

echo "Creating DATASETS on Internal Disks..."; sleep 1
## Create ZFS datasets on ZDISK1 ##
sudo zfs create -o atime=off ZDISK1/Assets
sudo zfs create -o atime=off ZDISK1/Assets/Audio
sudo zfs create -o atime=off ZDISK1/Assets/Cinematography
sudo zfs create -o atime=off ZDISK1/Assets/Graphics
sudo zfs create -o atime=off ZDISK1/Assets/Photography
## Create ZFS datasets on ZDISK2 ##
sudo zfs create -o atime=off ZDISK2/Arcade
sudo zfs create -o atime=off ZDISK2/Arcade/ROMS
sudo zfs create -o atime=off ZDISK2/Arcade/Steam
## Create ZFS datasets on ZDISK3 ##
sudo zfs create -o atime=off ZDISK3/Baazar
sudo zfs create -o atime=off ZDISK3/Baazar/Desktop
sudo zfs create -o atime=off ZDISK3/Baazar/Downloads
sudo zfs create -o atime=off ZDISK3/Baazar/Public
sudo zfs create -o atime=off ZDISK3/Baazar/Templates
## Create ZFS datasets on ZDISK4 ##
sudo zfs create -o atime=off ZDISK4/Hoards
sudo zfs create -o atime=off ZDISK4/Hoards/Documents
sudo zfs create -o atime=off ZDISK4/Hoards/Music
sudo zfs create -o atime=off ZDISK4/Hoards/Pictures
sudo zfs create -o atime=off ZDISK4/Hoards/Videos
clear

echo "Creating datasets on G-DRIVE..."; sleep 1
## Create ZFS external datasets/filesystems ##
sudo zfs create -o atime=off ZDISK5/G-DRIVE
sudo zfs create -o atime=off ZDISK5/G-DRIVE/Backups
sudo zfs create -o atime=off ZDISK5/G-DRIVE/Hoards
clear

echo "Setting permissions for all datasets to current user..."; sleep 1
## Set volume permissions to current user ##
sudo chown -R $USER:$USER /ZDISK1/Assets
sudo chown -R $USER:$USER /ZDISK2/Arcade
sudo chown -R $USER:$USER /ZDISK3/Baazar
sudo chown -R $USER:$USER /ZDISK4/Hoards
sudo chown -R $USER:$USER /ZDISK5/G-DRIVE
clear

echo "Setting mount points for all datasets..."; sleep 1
## Mount ZFS datasets to specified points ##
sudo zfs set mountpoint=$HOME/Assets    ZDISK1/Assets
sudo zfs set mountpoint=$HOME/Arcade    ZDISK2/Arcade
sudo zfs set mountpoint=$HOME/Desktop   ZDISK3/Baazar/Desktop
sudo zfs set mountpoint=$HOME/Downloads ZDISK3/Baazar/Downloads
sudo zfs set mountpoint=$HOME/Public    ZDISK3/Baazar/Public
sudo zfs set mountpoint=$HOME/Templates ZDISK3/Baazar/Templates
sudo zfs set mountpoint=$HOME/Documents ZDISK4/Hoards/Documents
sudo zfs set mountpoint=$HOME/Music     ZDISK4/Hoards/Music
sudo zfs set mountpoint=$HOME/Pictures  ZDISK4/Hoards/Pictures
sudo zfs set mountpoint=$HOME/Videos    ZDISK4/Hoards/Videos
sudo zfs set mountpoint=$HOME/G-DRIVE   ZDISK5/G-DRIVE
clear

# END-OF-SCRIPT #