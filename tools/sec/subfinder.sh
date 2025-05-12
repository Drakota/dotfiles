#!/bin/sh
DIR="$(dirname "$0")"
source $DIR/../../utils.sh

TOOL_NAME="subfinder"
TOOL_VERSION="2.4.5"
TOOL_ARCHIVE_PATH="/tmp/$TOOL_NAME.tar.gz"
INSTALL_PATH=$HOME/.local/bin
SUBFINDER_URL="https://github.com/projectdiscovery/subfinder/releases/download/v${TOOL_VERSION}/subfinder_${TOOL_VERSION}_linux_amd64.tar.gz"

preinstall_hook() { :; }

install_hook() {
	wget $SUBFINDER_URL -O $TOOL_ARCHIVE_PATH 
    echo "[*] Unpacking $TOOL_NAME..."
    tar -xzvf $TOOL_ARCHIVE_PATH -C /tmp 
    mv /tmp/$TOOL_NAME $INSTALL_PATH
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook