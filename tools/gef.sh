#!/bin/bash
source ../utils.sh

TOOL_NAME="gef"
echo "[*] Installing $TOOL_NAME"

PYTHON3_PATH=$(which python3)
PIP3_VERSION=$($PYTHON3_PATH -m pip --version 2>&1)
check_python_install

$PYTHON3_PATH -m pip install ropper keystone-engine
wget -O ~/.gdbinit-gef.py -q http://gef.blah.cat/py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit

echo "[+] $TOOL_NAME successfully installed"
