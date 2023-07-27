#!/usr/bin/env bash

sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt -yq upgrade
cat requirements_utilities.txt | xargs sudo DEBIAN_FRONTEND=noninteractive apt -yq install
cat requirements_toolset.txt | xargs sudo DEBIAN_FRONTEND=noninteractive apt -yq install

# personalised configurations
mkdir -p $HOME/.local/share/navi/cheats $HOME/.config/i3 $HOME/.config/compton $HOME/.config/rofi $HOME/.config/feroxbuster $HOME/.config/terminator
cp -r .local/share/navi/cheats $HOME/.local/share/navi
cp -r .mozilla $HOME
cp .zprofile $HOME
cp .rustscan.toml $HOME
cp .config/i3/config $HOME/.config/i3/config
cp .config/feroxbuster/ferox-config.toml $HOME/.config/feroxbuster/ferox-config.toml
cp .config/terminator/config $HOME/.config/terminator/config
cp .config/i3/i3blocks.conf $HOME/.config/i3/i3blocks.conf
cp .config/compton/compton.conf $HOME/.config/compton/compton.conf
cp .config/rofi/config $HOME/.config/rofi/config
cp .config/i3/clipboard_fix.sh $HOME/.config/i3/clipboard_fix.sh
betterlockscreen -u . --fx color --color 808080

# rust tools install
cargo install rustscan navi

# github tools install
sudo curl -sL https://api.github.com/repos/carlospolop/PEASS-ng/releases/latest | jq -r ".assets[].browser_download_url" | sudo tee git_peass
sudo mkdir -p /opt/peass && sudo wget -i git_peass -P /opt/peass
sudo wget https://raw.githubusercontent.com/itm4n/PrivescCheck/master/PrivescCheck.ps1 -P /opt/peass
sudo curl -sL https://api.github.com/repos/DominicBreuker/pspy/releases/latest | jq -r ".assets[].browser_download_url" | sudo tee git_pspy
sudo mkdir -p /opt/pspy && sudo wget -i git_pspy -P /opt/pspy
sudo curl -sL https://api.github.com/repos/jpillora/chisel/releases/latest | jq -r ".assets[].browser_download_url" | grep -e 386 -e amd64 | grep -v darwin | sudo tee git_chisel
sudo mkdir -p /opt/lateral && sudo wget -i git_chisel -P /opt/lateral
sudo rm git_peass git_pspy git_chisel
sudo mkdir -p /opt/webshells
sudo git clone https://github.com/ivan-sincek/php-reverse-shell.git /opt/webshells/php-reverse-shell
sudo mkdir -p /opt/webshells/p0wny-shell
sudo wget https://raw.githubusercontent.com/flozz/p0wny-shell/master/shell.php -P /opt/webshells/p0wny-shell
sudo mkdir -p /opt/win_binaries
sudo wget https://gitlab.com/kalilinux/packages/windows-binaries/-/raw/kali/master/nc.exe -P /opt/win_binaries
sudo wget https://live.sysinternals.com/PsExec.exe -P /opt/win_binaries
sudo wget https://live.sysinternals.com/PsExec64.exe -P /opt/win_binaries
sudo wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer32.exe -P /opt/win_binaries
sudo wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe -P /opt/win_binaries
sudo wget https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20220919/mimikatz_trunk.7z -P /opt/win_binaries
sudo mkdir /opt/lin_binaries
elf=$(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases | jq -r ".[].tag_name" | grep nmap | head -n 1)
sudo wget $(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases/tags/$elf | jq -r ".assets[].browser_download_url" | grep _64 | grep tar) -P /opt/lin_binaries
elf=$(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases | jq -r ".[].tag_name" | grep socat | head -n 1)
sudo wget $(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases/tags/$elf | jq -r ".assets[].browser_download_url" | grep _64) -P /opt/lin_binaries

# python tools install

pip3 install bloodhound

# ruby tools install
sudo gem install evil-winrm

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
