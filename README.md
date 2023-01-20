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

- Customise firefox (Bookmarks, profile, foxyproxy addon)
- Add lockscreen
- fix compton opacity with terminator
- add command to send vpn ip address to clipboard on click
