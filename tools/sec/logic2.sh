#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/../../utils.sh

TOOL_NAME="logic2"
LOGIC2_APPIMAGE_URL="https://downloads.saleae.com/logic2/Logic-2.3.27-master.AppImage"

preinstall_hook() { :; }

install_hook() {
    wget -q --show-progress $LOGIC2_APPIMAGE_URL -O /tmp/$TOOL_NAME
    sudo chmod +x /tmp/$TOOL_NAME
    mv /tmp/$TOOL_NAME $HOME/.local/bin/
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook