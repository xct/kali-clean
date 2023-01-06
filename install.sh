#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo echo -e "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

sudo apt -y install build-essential checkinstall autoconf automake autotools-dev m4 meson
sudo apt -y install libx11-dev freeglut3-dev jq arandr libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev
sudo apt -y install arc-theme papirus-icon-theme feh unclutter compton imagemagick python3-pip rofi i3blocks rust-alacritty

# pentest tools, will be a growing list
sudo apt -y install crackmapexec enum4linux nikto nmap smbclient smbmap snmp sslscan feroxbuster flameshot bloodhound neo4j cargo exiftool chisel seclists

source $HOME/.cargo/env

mkdir -p ~/.config/i3 ~/.config/compton ~/.config/rofi ~/.config/alacritty ~/.config/feroxbuster
sudo mv .rustscan.toml
sudo mv .config/i3/config ~/.config/i3/config
sudo mv .config/feroxbuster/ferox-config.toml ~/.config/feroxbuster/ferox-config.toml
sudo mv .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
sudo mv .config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
sudo mv .config/compton/compton.conf ~/.config/compton/compton.conf
sudo mv .config/rofi/config ~/.config/rofi/config
sudo mv .config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh

# github tools install
cargo install rustscan
sudo git clone https://github.com/ivan-sincek/php-reverse-shell.git webshells
sudo curl -sL https://api.github.com/repos/carlospolop/PEASS-ng/releases/latest | jq -r ".assets[].browser_download_url" > peass
sudo curl -sL https://api.github.com/repos/DominicBreuker/pspy/releases/latest | jq -r ".assets[].browser_download_url" > pspy
sudo mv peass /opt/peass
sudo mv pspy /opt/pspy
cd /opt/peass
sudo wget -i peass
cd ..
cd /opt/pspy
sudo wget -i pspy
cd ..
sudo git clone https://github.com/ivan-sincek/php-reverse-shell.git webshells
cd ~

# pip tools install
pip3 install bloodhound

# nerdfonts install/reboot
mkdir -p ~/.local/share/fonts/

sudo curl -sL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r ".assets[] | select(.name | test(\"Iosevka\")) | .browser_download_url" > iosevka
wget -i iosevka
sudo curl -sL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r ".assets[] | select(.name | test(\"RobotoMono\")) | .browser_download_url" > robotomono
wget -i robotomono

unzip Iosevka.zip -d ~/.local/share/fonts/
unzip RobotoMono.zip -d ~/.local/share/fonts/

fc-cache -fv

echo "Done! Please reboot: Select i3 on login, run lxappearance and select arc-dark"
