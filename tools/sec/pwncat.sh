#!/bin/sh
DIR="$(dirname "$0")"
source $DIR/../../utils.sh

TOOL_NAME="pwncat"

preinstall_hook() {
    check_python_install
}

install_hook() {
    $PYTHON3_PATH -m pip install git+https://github.com/calebstewart/pwncat
    $PYTHON3_PATH -m pip install git+https://github.com/JohnHammond/base64io-python
    $PYTHON3_PATH -m pip install -U git+https://github.com/calebstewart/paramiko
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook