#!/usr/bin/env bash

# TODO: remove once kali updates its repo for i3 4.22+
# echo -e "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list
sudo apt -y install apt-transport-https
curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
printf 'Package: i3*\nPin: origin "baltocdn.com"\nPin-Priority: 1001' | sudo tee /etc/apt/preferences.d/00-i3-autobuild.pref

sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt -yq upgrade
cat requirements_utilities.txt | xargs sudo DEBIAN_FRONTEND=noninteractive apt -yq install
cat requirements_toolset.txt | xargs sudo DEBIAN_FRONTEND=noninteractive apt -yq install

# personalised configurations
mkdir -p $HOME/.config/i3 $HOME/.config/compton $HOME/.config/rofi $HOME/.config/alacritty $HOME/.config/feroxbuster
cp .zprofile $HOME
cp .rustscan.toml $HOME
cp .config/i3/config $HOME/.config/i3/config
cp .config/feroxbuster/ferox-config.toml $HOME/.config/feroxbuster/ferox-config.toml
cp .config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
cp .config/i3/i3blocks.conf $HOME/.config/i3/i3blocks.conf
cp .config/compton/compton.conf $HOME/.config/compton/compton.conf
cp .config/rofi/config $HOME/.config/rofi/config
cp .config/i3/clipboard_fix.sh $HOME/.config/i3/clipboard_fix.sh

# github tools install
cargo install rustscan
sudo curl -sL https://api.github.com/repos/carlospolop/PEASS-ng/releases/latest | jq -r ".assets[].browser_download_url" > git_peass
sudo mkdir -p /opt/peass && sudo wget -i git_peass -P /opt/peass
sudo curl -sL https://api.github.com/repos/DominicBreuker/pspy/releases/latest | jq -r ".assets[].browser_download_url" > git_pspy
sudo mkdir -p /opt/pspy && sudo wget -i git_pspy -P /opt/pspy
rm git_peass git_pspy
sudo mkdir -p /opt/webshells
sudo git clone https://github.com/ivan-sincek/php-reverse-shell.git /opt/webshells/php-reverse-shell
sudo mkdir -p /opt/win_binaries
sudo wget https://github.com/skyformat99/netcat-for-windows/blob/master/1.12/nc.exe -P /opt/win_binaries
sudo wget https://github.com/skyformat99/netcat-for-windows/blob/master/1.12/nc64.exe -P /opt/win_binaries
sudo wget https://live.sysinternals.com/PsExec.exe -P /opt/win_binaries
sudo wget https://live.sysinternals.com/PsExec64.exe -P /opt/win_binaries
sudo wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer32.exe -P /opt/win_binaries
sudo wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe -P /opt/win_binaries

# pip tools install
pip3 install bloodhound

# nerdfonts install/reboot
mkdir -p ~/.local/share/fonts/
sudo curl -sL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r ".assets[] | select(.name | test(\"Iosevka\")) | .browser_download_url" > iosevka
wget -i iosevka
rm iosevka
sudo curl -sL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r ".assets[] | select(.name | test(\"RobotoMono\")) | .browser_download_url" > robotomono
wget -i robotomono
rm robotomono
7z x Iosevka.zip -o$HOME/.local/share/fonts/
7z x RobotoMono.zip -o$HOME/.local/share/fonts/
rm Iosevka.zip
rm RobotoMono.zip
fc-cache -fv

# configure audio
sudo apt -y install pipewire-pulse wireplumber pipewire-media-session-
systemctl --user --now enable wireplumber.service

echo "Done! Please reboot: Select i3 on login, run lxappearance and select arc-dark, you can also delete this repo."
