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


setup_tool() {
    echo "[*] Installing $TOOL_NAME"
    ($1)
    ($2)
    ($3)
    echo "[+] $TOOL_NAME successfully installed"
}