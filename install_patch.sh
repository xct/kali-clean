sudo mkdir /opt/lin_binaries
nmap=$(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases | jq -r ".[].tag_name" | grep nmap | head -n 1)
sudo wget $(sudo curl -sL https://api.github.com/repos/ernw/static-toolbox/releases/tags/$nmap | jq -r ".assets[].browser_download_url" | grep _64 | grep tar) -P /opt/lin_binaries
