#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/../utils.sh

TOOL_NAME="debian packages"

preinstall_hook() {
    check_debian_based
}

install_hook() {
    sudo apt-get install rlwrap xclip
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook