# Kali-Clean

[xct/kali-clean](https://github.com/xct/kali-clean) with personal tweaks and borrowed ideas from [islanddog/kali-clean-pwnbox](https://github.com/islanddog/kali-clean-pwnbox).

This post-installation script is intended to be used on minimal Kali VM with no tools. I used [the official VM build script](https://gitlab.com/kalilinux/build-scripts/kali-vm) with the following options to get started. It should still work fine on a bare metal installation.

```
./build.sh -v vmware -D none -Z $(cat /etc/timezone) -T none -P "network-manager curl neovim"
```

If you are building on a Windows machine:

- you will need WSL2
- install docker in WSL2

```
# confirm you are running WSL2
wsl --version

# start the docker service
sudo systemctl start docker

# continue building your kali VM
./build-in-container.sh -v vmware -D none -Z $(cat /etc/timezone) -T none -P "network-manager curl neovim"

# copy from WSL to your Windows host (eg. Downloads folder)
cp -r images/kali-linux-rolling-vmware-amd64.vmwarevm /mnt/c/Users/<USER>/Downloads
```

## Installation

```
sudo -sE ./install.sh 2>install.err
```

## QoL Improvements vs default Kali
- Built in cheatsheets using [Navi](https://github.com/denisidoro/navi)
```
navi --print
```
- Windows binaries symlinked into Apache webroot
```
# binaries located in /var/www/html/win/
sudo systemctl start apache2
```
- Optional install scripts in `kali-clean/optional_installs/`
- IP address of `tun0` is displayed, no need to run `ip a` everytime
- Better firefox profile: Removed default bookmarks, ublock, foxyproxy, wappalyzer and restore tabs on startup.

## TODOs

- [AD] https://github.com/eladshamir/Whisker
- alias navi to n

## Checkout
Below are things I will get around to trying and will add them to the install script if I find them useful.
- https://github.com/Flangvik/SharpCollection
- https://github.com/bohops/GhostBuild
- https://github.com/AdrianVollmer/PowerHub

## Credit
- https://github.com/AyoItsYas/Mainte
