#!/bin/bash
set -exo pipefail
IFS=$'\n\t'
export DEBIAN_FRONTEND=noninteractive

PACKAGES=("git" "curl" "wget" "vim")

install_package() {
    local package=$1

    if dpkg -l "$package" > /dev/null 2>&1; then
        echo "$package is already installed"
    else
        echo "Installing $package..."
        sudo apt-get install -y "$package"
    fi
}

main() {
  
    echo "Updating package list and upgrading the system..."
    sudo apt-get update
    sudo apt-get upgrade -y

    for package in "${PACKAGES[@]}"; do
        install_package "$package"
    done

    echo "Installation finished."
}

main "$@"
