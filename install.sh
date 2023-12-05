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
# python tools install
pip3 install bloodhound
# ruby tools install
sudo gem install evil-winrm

# wget tools install into /opt
sudo mkdir -p /opt/lin /opt/web /opt/win
sudo curl -sL https://api.github.com/repos/jpillora/chisel/releases/latest | jq -r ".assets[].browser_download_url" | grep -e 386 -e amd64 | grep -v darwin | sudo tee /tmp/git_download
sudo curl -sL https://api.github.com/repos/projectdiscovery/naabu/releases/latest | jq -r ".assets[].browser_download_url" | grep -e 386 -e amd64 | sudo tee -a /tmp/git_download
sudo cat /tmp/git_download | grep linux | sudo tee /tmp/git_download_lin
sudo cat /tmp/git_download | grep windows | sudo tee /tmp/git_download_win
elf=$(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases | jq -r ".[].tag_name" | grep nmap | head -n 1)
sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases/tags/$elf | jq -r ".assets[].browser_download_url" | grep _64 | grep tar | sudo tee -a /tmp/git_download_lin
elf=$(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases | jq -r ".[].tag_name" | grep socat | head -n 1)
sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases/tags/$elf | jq -r ".assets[].browser_download_url" | grep _64 | sudo tee -a /tmp/git_download_lin
sudo wget -i /tmp/git_chisel_lin -P /opt/lin
sudo wget -i /tmp/git_chisel_win -P /opt/win
sudo wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -P /opt/lin
sudo curl -sL https://api.github.com/repos/DominicBreuker/pspy/releases/latest | jq -r ".assets[].browser_download_url" | sudo tee /tmp/git_pspy
sudo mkdir -p /opt/lin/pspy && sudo wget -i /tmp/git_pspy -P /opt/lin/pspy
sudo git clone https://github.com/ivan-sincek/php-reverse-shell.git /opt/web/php-reverse-shell
sudo wget https://raw.githubusercontent.com/flozz/p0wny-shell/master/shell.php -P /opt/web/p0wny-shell
sudo wget https://raw.githubusercontent.com/z3mms/HostRecon/master/HostRecon.ps1 -P /opt/win
sudo wget https://raw.githubusercontent.com/thamyekh/OSEP-Code-Snippets/main/active_directory/Invoke-Mimikatz2.ps1 -P /opt/win
sudo wget https://gitlab.com/kalilinux/packages/windows-binaries/-/raw/kali/master/nc.exe -P /opt/win
sudo wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer32.exe -P /opt/win
sudo wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe -P /opt/win
sudo wget https://live.sysinternals.com/PsExec.exe -P /opt/win
sudo wget https://live.sysinternals.com/PsExec64.exe -P /opt/win
sudo wget https://github.com/Flangvik/SharpCollection/raw/master/NetFramework_4.7_Any/Rubeus.exe -P /opt/win
sudo wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe -P /opt/win
sudo ln -s /opt/lin /var/www/html/lin
sudo ln -s /opt/web /var/www/html/web
sudo ln -s /opt/win /var/www/html/win
# TODO: remove this line after checking nabuu linwinpeas chisel p0wnyshell php nmap socat rubeus are installed


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

echo "Done! After reboot run lxappearance and select arc-dark, you can also delete this repo."
