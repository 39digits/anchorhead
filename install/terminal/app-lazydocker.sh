# Description: Installs lazydocker - a simple terminal UI for docker

# Based on:
# curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# allow specifying different destination directory
#DIR="${DIR:-"$HOME/.local/bin"}"
DIR="/usr/local/bin"

# map different architecture variations to the available binaries
ARCH=$(uname -m)
case $ARCH in
    i386|i686) ARCH=x86 ;;
    armv6*) ARCH=armv6 ;;
    armv7*) ARCH=armv7 ;;
    aarch64*) ARCH=arm64 ;;
esac

# prepare the download URL
GITHUB_LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' https://github.com/jesseduffield/lazydocker/releases/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
GITHUB_FILE="lazydocker_${GITHUB_LATEST_VERSION//v/}_$(uname -s)_${ARCH}.tar.gz"
GITHUB_URL="https://github.com/jesseduffield/lazydocker/releases/download/${GITHUB_LATEST_VERSION}/${GITHUB_FILE}"

# install/update the local binary
cd /tmp
curl -L -o lazydocker.tar.gz $GITHUB_URL
tar xzvf lazydocker.tar.gz lazydocker
sudo install -Dm 755 lazydocker -t "$DIR"
rm lazydocker lazydocker.tar.gz
cd -
