#!/bin/bash
echo -e "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list
curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list

sudo apt update && sudo apt upgrade -y
sudo apt -y install build-essential checkinstall autoconf automake autotools-dev m4 meson cargo
sudo apt -y install arc-theme papirus-icon-theme feh flameshot unclutter compton python3-pip rofi i3blocks alacritty neovim
sudo apt -y install curl p7zip-full
# pentest tools, will be a growing list
sudo apt -y install crackmapexec enum4linux nikto nmap smbclient smbmap snmp sslscan feroxbuster bloodhound neo4j exiftool chisel seclists

source $HOME/.cargo/env
echo 'export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH' >> .zshrc
echo 'export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH' >> .bashrc

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
rm iosevka
sudo curl -sL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r ".assets[] | select(.name | test(\"RobotoMono\")) | .browser_download_url" > robotomono
wget -i robotomono
rm -i robotomono

7z x Iosevka.zip -o.local/share/fonts/
7z x RobotoMono.zip -o.local/share/fonts/

fc-cache -fv

echo "Done! Please reboot: Select i3 on login, run lxappearance and select arc-dark"
