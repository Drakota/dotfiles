#!/bin/bash
source ../utils.sh

TOOL_NAME="pwncat"
echo "[*] Installing $TOOL_NAME"

PYTHON3_PATH=$(which python3)
PIP3_VERSION=$($PYTHON3_PATH -m pip --version 2>&1)
check_python_install

$PYTHON3_PATH -m pip install git+https://github.com/calebstewart/pwncat
$PYTHON3_PATH -m pip install git+https://github.com/JohnHammond/base64io-python
$PYTHON3_PATH -m pip install -U git+https://github.com/calebstewart/paramiko

echo "[+] $TOOL_NAME successfully installed"
