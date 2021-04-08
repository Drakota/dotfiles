#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/../utils.sh

TOOL_NAME="bat"
BAT_DEB_URL="https://github.com/sharkdp/bat/releases/download/v0.18.0/bat-musl_0.18.0_amd64.deb"
BAT_DEB_TEMP_FILE="bat.deb"

preinstall_hook() {
    check_debian_based
}

install_hook() {
    wget -q --show-progress $BAT_DEB_URL -O /tmp/$BAT_DEB_TEMP_FILE
    sudo dpkg -i /tmp/$BAT_DEB_TEMP_FILE
}

postinstall_hook() {
    rm /tmp/$BAT_DEB_TEMP_FILE
}

setup_tool preinstall_hook install_hook postinstall_hook