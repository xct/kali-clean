# Kali-Clean

[xct/kali-clean](https://github.com/xct/kali-clean) with personal tweaks and borrowed ideas from [islanddog/kali-clean-pwnbox](https://github.com/islanddog/kali-clean-pwnbox).

This post-installation script is intended to be used on minimal Kali VM with no tools. I used [the official VM build script](https://gitlab.com/kalilinux/build-scripts/kali-vm) with the following options to get started. It should still work fine on a bare metal installation.

```
./build.sh -v vmware -D none -Z $(cat /etc/timezone) -T none -P "network-manager curl neovim"
```

## Installation

```
./install.sh
```

## TODOs

- Add VS Code / OmniSharp / Mono
- Add atom-ng GUI text editor
- [CTF] cargo rust install project_ares
- Add linux static binaries (specifically nc and nmap) https://github.com/andrew-d/static-binaries
