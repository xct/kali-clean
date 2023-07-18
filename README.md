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
./install.sh
```

## TODOs

- Add VS Code / OmniSharp / Mono
- Add linux static binaries (nc, nmap, socat) https://github.com/andrew-d/static-binaries https://github.com/ernw/static-toolbox
- [OSEP] Add evilclippy
- [OSEP] SYANiDE-/SuperSharpShooter
- [AD] powerview and powermad
- https://github.com/flozz/p0wny-shell
- [/opt/win_binaries/] https://github.com/gentilkiwi/mimikatz/releases/tag/2.2.0-20220919
- [NAVI] https://cheatsheet.haax.fr/windows-systems/exploitation/crackmapexec/
- [NAVI] https://cheatsheet.haax.fr/windows-systems/exploitation/rdp_exploitation/
- https://github.com/itm4n/PrivescCheck
- cheatsheet powershell download into memory
- see if python2 pip works if not:https://www.kali.org/docs/general-use/using-eol-python-versions/ try installing offsec-awae-python2 first
- [AD] https://github.com/dirkjanm/krbrelayx

## Checkout
- [CTF] https://github.com/bee-san/Ares
