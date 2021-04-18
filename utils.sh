#!/bin/bash

check_python_install() {
    if [ -z "${PYTHON3_PATH}" ]; then
        echo "[-] Python3 not installed, skipping $TOOL_NAME..."
        exit 1
    fi
    
    if [[ $PIP3_VERSION =~ "No module" ]]; then
        echo "[-] Pip not installed, skipping $TOOL_NAME..."
        exit 1
    fi
}

check_debian_based() {
    if ! grep -iEq "ubuntu|debian|kali|mint" /etc/issue; then
        echo "[-] Not Debian based, skipping $TOOL_NAME..."
        exit 1
    fi
}

skip_if_folder_exists() {
    if [ -d $1 ]; then
        echo "[-] Folder already exists at $1, skipping $TOOL_NAME..."
        exit 1
    fi
}

setup_tool() {
    echo "[*] Installing $TOOL_NAME"
    ($1)
    ($2)
    ($3)
    echo "[+] $TOOL_NAME successfully installed"
}