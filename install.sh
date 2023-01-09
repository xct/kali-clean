#!/usr/bin/env bash
echo -e "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee -a /etc/apt/sources.list

# TODO: remove once kali updates its repo for i3 4.22+
curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt -y install apt-transport-https
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
echo 'Package: i3*\nPin: origin "baltocdn.com"\nPin-Priority: 1001' | sudo tee /etc/apt/preferences.d/00-i3-autobuild.pref

sudo apt update && sudo apt upgrade -y
cat requirements_utilities.txt | xargs sudo apt -y install
cat requirements_toolset.txt | xargs sudo apt -y install

source $HOME/.cargo/env
echo 'export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH' >> $HOME/.zshrc
echo 'export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH' >> $HOME/.bashrc

mkdir -p ~/.config/i3 ~/.config/compton ~/.config/rofi ~/.config/alacritty ~/.config/feroxbuster
cp .rustscan.toml ~
cp .config/i3/config ~/.config/i3/config
cp .config/feroxbuster/ferox-config.toml ~/.config/feroxbuster/ferox-config.toml
cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp .config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
cp .config/compton/compton.conf ~/.config/compton/compton.conf
cp .config/rofi/config ~/.config/rofi/config
cp .config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh

# github tools install
cargo install rustscan
sudo curl -sL https://api.github.com/repos/carlospolop/PEASS-ng/releases/latest | jq -r ".assets[].browser_download_url" > git_peass
sudo mkdir -p /opt/peass && sudo wget -i git_peass -P /opt/peass
sudo curl -sL https://api.github.com/repos/DominicBreuker/pspy/releases/latest | jq -r ".assets[].browser_download_url" > git_pspy
sudo mkdir -p /opt/pspy && sudo wget -i git_pspy -P /opt/pspy
rm git_peass git_pspy
mkdir -p /opt/webshells
sudo git clone https://github.com/ivan-sincek/php-reverse-shell.git /opt/webshells/php-reverse-shell

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
7z x Iosevka.zip -o.local/share/fonts/
7z x RobotoMono.zip -o.local/share/fonts/
rm Iosevka.zip
rm RobotoMono.zip
fc-cache -fv

# configure audio
sudo apt -y install pipewire-pulse wireplumber pipewire-media-session-
systemctl --user --now enable wireplumber.service

echo "Done! Please reboot: Select i3 on login, run lxappearance and select arc-dark, you can also delete this repo."
