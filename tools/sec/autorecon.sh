#!/bin/sh
DIR="$(dirname "$0")"
source $DIR/../../utils.sh

TOOL_NAME="autorecon"

preinstall_hook() {
    check_python_install
}

install_hook() {
    $PYTHON3_PATH -m pip install git+https://github.com/Tib3rius/AutoRecon.git 
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook