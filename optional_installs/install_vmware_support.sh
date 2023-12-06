#!/usr/bin/env bash

# enable shared clipboard between host and vmware guest
sudo apt -y install open-vm-tools open-vm-tools-desktop
echo 'exec --no-startup-id vmware-user-suid-wrapper' | tee -a $HOME/.config/i3/config
echo "Done! Please reboot for clipboard share to take effect."
