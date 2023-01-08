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
    fonts-courier-prime \
    fonts-firacode \
    fonts-ibm-plex \
    fonts-inter \
    fonts-jetbrains-mono \
    fonts-texgyre \
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
    io.github.wereturtle.ghostwriter \
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

# Cleanup #
echo "Removing Unwanted Fonts..."; sleep 1
sudo find /usr/share/fonts -type f -iname .uuid -delete
sudo apt purge -y \
  fonts-beng \
  fonts-beng-extra \
  fonts-deva \
  fonts-deva-extra \
  fonts-gargi \
  fonts-gubbi \
  fonts-gujr \
  fonts-gujr-extra \
  fonts-guru \
  fonts-guru-extra \
  fonts-indic \
  fonts-kacst \
  fonts-kacst-one \
  fonts-kalapi \
  fonts-khmeros-core \
  fonts-knda \
  fonts-lao \
  fonts-lklug-sinhala \
  fonts-lohit-beng-assamese \
  fonts-lohit-beng-bengali \
  fonts-lohit-deva \
  fonts-lohit-gujr \
  fonts-lohit-guru \
  fonts-lohit-knda \
  fonts-lohit-mlym \
  fonts-lohit-orya \
  fonts-lohit-taml \
  fonts-lohit-taml-classical \
  fonts-lohit-telu \
  fonts-mlym \
  fonts-nakula \
  fonts-navilu \
  fonts-orya \
  fonts-orya-extra \
  fonts-pagul \
  fonts-sahadeva \
  fonts-samyak-deva \
  fonts-samyak-gujr \
  fonts-samyak-mlym \
  fonts-samyak-taml \
  fonts-sarai \
  fonts-sil-abyssinica \
  fonts-sil-padauk \
  fonts-smc \
  fonts-smc-anjalioldlipi \
  fonts-smc-chilanka \
  fonts-smc-dyuthi \
  fonts-smc-gayathri \
  fonts-smc-karumbi \
  fonts-smc-keraleeyam \
  fonts-smc-manjari \
  fonts-smc-meera \
  fonts-smc-rachana \
  fonts-smc-raghumalayalamsans \
  fonts-smc-suruma \
  fonts-smc-uroob \
  fonts-taml \
  fonts-telu \
  fonts-telu-extra \
  fonts-teluguvijayam \
  fonts-thai-tlwg \
  fonts-tibetan-machine \
  fonts-tlwg-garuda \
  fonts-tlwg-garuda-ttf \
  fonts-tlwg-kinnari \
  fonts-tlwg-kinnari-ttf \
  fonts-tlwg-laksaman \
  fonts-tlwg-laksaman-ttf \
  fonts-tlwg-loma \
  fonts-tlwg-loma-ttf \
  fonts-tlwg-mono \
  fonts-tlwg-mono-ttf \
  fonts-tlwg-norasi \
  fonts-tlwg-norasi-ttf \
  fonts-tlwg-purisa \
  fonts-tlwg-purisa-ttf \
  fonts-tlwg-sawasdee \
  fonts-tlwg-sawasdee-ttf \
  fonts-tlwg-typewriter \
  fonts-tlwg-typewriter-ttf \
  fonts-tlwg-typist \
  fonts-tlwg-typist-ttf \
  fonts-tlwg-typo \
  fonts-tlwg-typo-ttf \
  fonts-tlwg-umpush \
  fonts-tlwg-umpush-ttf \
  fonts-tlwg-waree \
  fonts-tlwg-waree-ttf \
  fonts-yrsa-rasa
clear

# END-OF-SCRIPT #
