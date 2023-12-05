sudo mkdir /opt/lin_binaries
elf=$(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases | jq -r ".[].tag_name" | grep socat | head -n 1)
sudo wget $(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases/tags/$elf | jq -r ".assets[].browser_download_url" | grep _64) -P /opt/lin_binaries
