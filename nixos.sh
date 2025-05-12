#!/bin/sh
DIR="$(pwd)"
source $DIR/utils.sh

TOOL_NAME="NixOs"

preinstall_hook() {
    echo "[*] Checking for Nix hardware configuration..."
    if [ -f /etc/nixos/hardware-configuration.nix ]; then
        echo "[+] Nix hardware configuration found"
        echo "[*] Backup existing hardware configuration..."
        sudo cp /etc/nixos/hardware-configuration.nix $DIR/nixos/hardware-configuration.nix
        echo "[+] Backup complete"
    else
        echo "[*] Nix hardware configuration not found. Continuing..."
    fi
}

install_hook() {
    echo "[*] Deleting existing NixOS configuration..."
    sudo rm -rf /etc/nixos
    echo "[+] Existing NixOS configuration deleted"
    echo "[*] Symlinking NixOS configuration..."
    sudo ln -s $DIR/nixos /etc/nixos
    echo "[+] NixOS configuration symlinked"
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook