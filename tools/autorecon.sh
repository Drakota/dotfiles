#!/bin/bash

TOOL_NAME="autorecon"
echo "[*] Installing $TOOL_NAME"

PYTHON3_PATH=$(which python3)
if [ -z "${PYTHON3_PATH}" ]; then
	echo "[-] Python3 not installed, skipping $TOOL_NAME..."
	exit 1
fi

PIP3_VERSION=$($PYTHON3_PATH -m pip --version 2>&1)
if [[ $PIP3_VERSION =~ "No module" ]]; then
	echo "[-] Pip not installed, skipping $TOOL_NAME..."
	exit 1
fi

$PYTHON3_PATH -m pip install git+https://github.com/Tib3rius/AutoRecon.git 
echo "[+] $TOOL_NAME successfully installed"
