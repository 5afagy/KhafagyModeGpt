#!/bin/bash

PYTHON_VERSION="3.11"
SUPPORTED_VERSIONS=("3.11" "3.10" "3.9" "2.7")
DEST_BIN_DIR="/usr/local/bin"
DEST_PKG_DIR=""

# Check Python versions and set the destination package directory accordingly
for version in "${SUPPORTED_VERSIONS[@]}"; do
    if command -v "python${version}" &> /dev/null; then
        PYTHON_VERSION="$version"
        break
    fi
done

DEST_PKG_DIR="/usr/local/lib/python${PYTHON_VERSION}/dist-packages"

# Install Pandora-ChatGPT using pip
pip install pandora-chatgpt

# Remove existing launcher.py
rm -rf "${DEST_PKG_DIR}/pandora/launcher.py"

# Clone KhafagyModeGpt repository
git clone https://github.com/5afagy/KhafagyModeGpt.git

# Move KhafagyMode and launcher.py
mv "KhafagyModeGpt/KhafagyMode" "${DEST_BIN_DIR}/"
mv "KhafagyModeGpt/launcher.py" "${DEST_PKG_DIR}/pandora/"
