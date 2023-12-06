#!/usr/bin/env bash

sudo apt install apt-transport-https dirmngr gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel msbuild monodevelop samba

mkdir -p $HOME/osep
git clone https://github.com/thamyekh/OSEP-Code-Snippets.git $HOME/osep
git clone https://github.com/outflanknl/EvilClippy.git $HOME/osep
git clone https://github.com/SYANiDE-/SuperSharpShooter.git $HOME/osep

sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.old
sudo cp smb.conf /etc/samba/smb.conf
sudo printf '[share]\n path = /home/kali/osep/\n browseable = yes\n read only = no' > /etc/samba/smb.conf
sudo smbpasswd -a kali
sudo systemctl start smbd nmbd
chmod -R 777 $HOME/osep
