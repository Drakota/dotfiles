#!/bin/bash

check_python_install() {
    if [ -z "${PYTHON3_PATH}" ]; then
        echo "[-] Python3 not installed, skipping $TOOL_NAME..."
        exit 1
    fi

    if [[ $PIP3_VERSION =~ "No module" ]]; then
        echo "[-] Pip not installed, skipping $TOOL_NAME..."
        exit 1
    fi
}
