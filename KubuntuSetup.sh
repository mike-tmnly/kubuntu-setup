#!/usr/bin/env bash

# SuperUser #
clear
echo "Requesting SuperUser Status..."; sudo echo "SuperUser Status Granted!"; sleep 1
clear

# Prerequisites #
echo "Preparing Config Environment..."; sleep 1
sudo apt update; sudo apt dist-upgrade -y
sudo snap refresh; sudo apt install -y flatpak
clear

# Sources #
echo "Preparing Software Sources..."; sleep 1
sudo flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo

# Software #
echo "Installing Packages..."; sleep 1
sudo apt install -y \
    argyll \
    beets \
    colord-kde \
    curl \
    elisa \
    exa \
    fish \
    inxi \
    libspa-0.2-bluetooth \
    libspa-0.2-jack \
    pipewire-audio-client-libraries \
    pipewire-media-session- \
    pulseaudio-module-bluetooth- \
    steam- \
    steam-devices \
    tmux \
    wireplumber \
    zfsutils-linux
clear

echo "Installing Flatpaks..."; sleep 1
sudo flatpak install -y \
    com.bitwarden.desktop \
    com.fightcade.Fightcade \
    com.github.Matoking.protontricks \
    com.github.tchx84.Flatseal \
    com.stepmania.StepMania \
    com.todoist.Todoist \
    com.valvesoftware.Steam \
    com.valvesoftware.Steam.CompatibilityTool.Proton-GE \
    com.visualstudio.code \
    com.vscodium.codium \
    md.obsidian.Obsidian \
    net.displaycal.DisplayCAL \
    org.ardour.Ardour \
    org.darktable.Darktable \
    org.gimp.GIMP \
    org.gimp.GIMP.Plugin.BIMP/x86_64/2-40 \
    org.gimp.GIMP.Plugin.FocusBlur/x86_64/2-40 \
    org.gimp.GIMP.Plugin.Fourier/x86_64/2-40 \
    org.gimp.GIMP.Plugin.GMic/x86_64/2-40 \
    org.gimp.GIMP.Plugin.LiquidRescale/x86_64/2-40 \
    org.gimp.GIMP.Plugin.Resynthesizer/x86_64/2-40 \
    org.inkscape.Inkscape \
    org.kde.kdenlive \
    org.kde.krita \
    org.libreoffice.LibreOffice \
    org.libretro.RetroArch \
    org.musicbrainz.Picard \
    org.qbittorrent.qBittorrent \
    org.standardnotes.standardnotes
clear

echo "Installing Snaps..."; sleep 1
sudo snap install \
    btop \
    htop \
    hugo \
    yt-dlp
clear

echo "Installing VueScan..."; sleep 1
wget https://d2bwyyzfw77fhf.cloudfront.net/version-archive/9.7.87/vuex6497.deb
sudo apt install -y ./vuex6497.deb; rm ./vuex6497.deb
clear

# Pipewire #
echo "Configuring Pipewire..."; sleep 1
systemctl --user --now enable wireplumber.service
sudo cp /usr/share/doc/pipewire/examples/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d/
sudo cp /usr/share/doc/pipewire/examples/ld.so.conf.d/pipewire-jack-*.conf /etc/ld.so.conf.d/
sudo ldconfig
clear

# Mitigations #
echo "Disabling Kernel Mitigations..."; sleep 1
sudo sed -i 's/quiet/quiet loglevel=0 mitigations=off/g' /etc/default/grub
sudo update-grub2
clear

# END-OF-SCRIPT #
