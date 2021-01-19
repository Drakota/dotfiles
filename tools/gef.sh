#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/../utils.sh

TOOL_NAME="gef"
PYTHON3_PATH=$(which python3)
PIP3_VERSION=$($PYTHON3_PATH -m pip --version 2>&1)

preinstall_hook() {
    check_python_install
}

install_hook() {
    $PYTHON3_PATH -m pip install ropper keystone-engine
    wget -O ~/.gdbinit-gef.py -q http://gef.blah.cat/py
    echo source ~/.gdbinit-gef.py >> ~/.gdbinit
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook