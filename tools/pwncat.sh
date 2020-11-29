#!/bin/bash

TOOL_NAME="pwncat"
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

$PYTHON3_PATH -m pip install git+https://github.com/calebstewart/pwncat
$PYTHON3_PATH -m pip install git+https://github.com/JohnHammond/base64io-python
$PYTHON3_PATH -m pip install -U git+https://github.com/calebstewart/paramiko
echo "[+] $TOOL_NAME successfully installed"
