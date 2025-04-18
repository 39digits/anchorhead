#!/bin/bash
# Description: Install JetBrains Toolbox

# Check if already installed
if [ -d ~/.local/share/JetBrains/Toolbox ]; then
    echo "JetBrains Toolbox is already installed."
    exit 0
fi

echo "Installing JetBrains Toolbox..."

# libfuse2 required
sudo apt install libfuse2

cd /
# Get the latest version URL
sudo apt install -y jq
LATEST_URL=$(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release" | jq -r '.TBA[0].downloads.linux.link')
# Download and extract
wget -O jetbrains-toolbox.tar.gz "$LATEST_URL"
tar -xzf jetbrains-toolbox.tar.gz jetbrains
./jetbrains/jetbrains-toolbox
cd -
