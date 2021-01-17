#!/bin/bash
source ../utils.sh

TOOL_NAME="autorecon"
echo "[*] Installing $TOOL_NAME"

PYTHON3_PATH=$(which python3)
PIP3_VERSION=$($PYTHON3_PATH -m pip --version 2>&1)
check_python_install

$PYTHON3_PATH -m pip install git+https://github.com/Tib3rius/AutoRecon.git 
echo "[+] $TOOL_NAME successfully installed"
