#!/usr/bin/env bash

sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt -yq upgrade
cat requirements_utilities.txt | xargs sudo DEBIAN_FRONTEND=noninteractive apt -yq install
cat requirements_toolset.txt | xargs sudo DEBIAN_FRONTEND=noninteractive apt -yq install

# personalised configurations
mkdir -p $HOME/.local/share/navi/cheats $HOME/.config/i3 $HOME/.config/compton $HOME/.config/rofi $HOME/.config/feroxbuster $HOME/.config/terminator $HOME/.config/gtk-3.0
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
cp .config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
betterlockscreen -u . --fx color --color 808080

# rust tools install
cargo install rustscan navi
# python tools install
pip3 install bloodhound
# ruby tools install
sudo gem install evil-winrm

# wget tools install into /opt
sudo mkdir -p /opt/lin /opt/web /opt/win
curl -sL https://api.github.com/repos/jpillora/chisel/releases/latest | jq -r ".assets[].browser_download_url" | grep -e 386 -e amd64 | grep -v darwin | tee /tmp/git_download
curl -sL https://api.github.com/repos/projectdiscovery/naabu/releases/latest | jq -r ".assets[].browser_download_url" | grep -e 386 -e amd64 | tee -a /tmp/git_download
cat /tmp/git_download | grep linux | tee /tmp/git_download_lin
cat /tmp/git_download | grep windows | tee /tmp/git_download_win
elf=$(curl -sL https://api.github.com/repos/ernw/static-toolbox/releases | jq -r ".[].tag_name" | grep nmap | head -n 1)
curl -sL https://api.github.com/repos/ernw/static-toolbox/releases/tags/$elf | jq -r ".assets[].browser_download_url" | grep _64 | grep tar | tee -a /tmp/git_download_lin
elf=$(curl -sL https://api.github.com/repos/ernw/static-toolbox/releases | jq -r ".[].tag_name" | grep socat | head -n 1)
curl -sL https://api.github.com/repos/ernw/static-toolbox/releases/tags/$elf | jq -r ".assets[].browser_download_url" | grep _64 | tee -a /tmp/git_download_lin
sudo wget -i /tmp/git_download_lin -P /opt/lin
sudo wget -i /tmp/git_download_win -P /opt/win
sudo wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -P /opt/lin
curl -sL https://api.github.com/repos/DominicBreuker/pspy/releases/latest | jq -r ".assets[].browser_download_url" | tee /tmp/git_pspy
sudo mkdir -p /opt/lin/pspy && sudo wget -i /tmp/git_pspy -P /opt/lin/pspy
sudo git clone https://github.com/ivan-sincek/php-reverse-shell.git /opt/web/php-reverse-shell
sudo wget https://raw.githubusercontent.com/flozz/p0wny-shell/master/shell.php -P /opt/web/p0wny-shell
sudo wget https://raw.githubusercontent.com/61106960/adPEAS/main/adPEAS.ps1 -P /opt/win
sudo wget https://raw.githubusercontent.com/61106960/adPEAS/main/adPEAS-Light.ps1 -P /opt/win
sudo wget https://raw.githubusercontent.com/GetRektBoy724/LocalAMSI.Fail/main/AMSIFailGenerator.cs -P /opt/win
sudo wget https://raw.githubusercontent.com/z3mms/HostRecon/master/HostRecon.ps1 -P /opt/win
sudo wget https://raw.githubusercontent.com/thamyekh/OSEP-Code-Snippets/main/active_directory/Invoke-Mimikatz2.ps1 -P /opt/win
sudo wget https://gitlab.com/kalilinux/packages/windows-binaries/-/raw/kali/master/nc.exe -P /opt/win
sudo wget https://raw.githubusercontent.com/BC-SECURITY/Empire/main/empire/server/data/module_source/situational_awareness/network/powerview.ps1 -P /opt/win
sudo wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer32.exe -P /opt/win
sudo wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe -P /opt/win
sudo wget https://raw.githubusercontent.com/itm4n/PrivescCheck/master/PrivescCheck.ps1 -P /opt/win
sudo wget https://live.sysinternals.com/PsExec.exe -P /opt/win
sudo wget https://live.sysinternals.com/PsExec64.exe -P /opt/win
sudo wget https://github.com/Flangvik/SharpCollection/raw/master/NetFramework_4.7_Any/Rubeus.exe -P /opt/win
sudo wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe -P /opt/win

# symlinking
sudo ln -s /opt/lin /var/www/html/lin
sudo ln -s /opt/web /var/www/html/web
sudo ln -s /opt/win /var/www/html/win
sudo ln -s /usr/lib/bloodhound/resources/app/Collectors/SharpHound.exe /opt/win/SharpHound.exe
sudo ln -s /usr/lib/bloodhound/resources/app/Collectors/SharpHound.ps1 /opt/win/SharpHound.ps1

# nerdfonts install/reboot
mkdir -p ~/.local/share/fonts/
curl -sL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r ".assets[] | select(.name | test(\"Iosevka\")) | .browser_download_url" | grep Iosevka.zip | tee /tmp/fonts.txt
curl -sL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r ".assets[] | select(.name | test(\"RobotoMono\")) | .browser_download_url" | grep RobotoMono.zip | tee -a /tmp/fonts.txt
wget -i /tmp/fonts.txt -P /tmp
mkdir -p $HOME/.local/share/fonts/iosevka && 7z x /tmp/Iosevka.zip -o$HOME/.local/share/fonts/iosevka
mkdir -p $HOME/.local/share/fonts/robotomono && 7z x /tmp/RobotoMono.zip -o$HOME/.local/share/fonts/robotomono
fc-cache -fv

# configure audio
sudo apt -y install pipewire-pulse wireplumber pipewire-media-session-
systemctl --user --now enable wireplumber.service
