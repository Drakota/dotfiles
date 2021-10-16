#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/../../utils.sh

TOOL_NAME="pwntools"

preinstall_hook() {
    check_python_install
}

install_hook() {
    $PYTHON3_PATH -m pip install pwntools 
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook