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
- Add linux static binaries (specifically nc and nmap) https://github.com/andrew-d/static-binaries https://github.com/ernw/static-toolbox
- Add evilclippy to OSEP
- Add SYANiDE-/SuperSharpShooter to OSEP
- Add powerview and powermad to AD
- Add https://github.com/dirkjanm/krbrelayx to AD
- https://github.com/flozz/p0wny-shell
- https://github.com/gentilkiwi/mimikatz/releases/tag/2.2.0-20220919
- https://cheatsheet.haax.fr/windows-systems/exploitation/crackmapexec/
- https://cheatsheet.haax.fr/windows-systems/exploitation/rdp_exploitation/
- https://github.com/itm4n/PrivescCheck
- mimikatz to /opt/win_binaries/
- cheatsheet powershell download into memory
- see if python2 pip works if not:https://www.kali.org/docs/general-use/using-eol-python-versions/ try installing offsec-awae-python2 first
