#!/bin/bash

TOOL_NAME="subfinder"
TOOL_VERSION="2.4.5"
TOOL_ARCHIVE_PATH="/tmp/$TOOL_NAME.tar.gz"
INSTALL_PATH=$HOME/.local/bin
echo "[*] Installing $TOOL_NAME"

wget "https://github.com/projectdiscovery/subfinder/releases/download/v${TOOL_VERSION}/subfinder_${TOOL_VERSION}_linux_amd64.tar.gz" -O $TOOL_ARCHIVE_PATH 
echo "[*] Unpacking $TOOL_NAME..."
tar -xzvf $TOOL_ARCHIVE_PATH -C /tmp 
mv /tmp/$TOOL_NAME $INSTALL_PATH

echo "[+] $TOOL_NAME successfully installed"
