#!/bin/bash
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
rm robotomono

7z x Iosevka.zip -o.local/share/fonts/
7z x RobotoMono.zip -o.local/share/fonts/

fc-cache -fv

echo "Done! Please reboot: Select i3 on login, run lxappearance and select arc-dark, you can also delete this repo."
