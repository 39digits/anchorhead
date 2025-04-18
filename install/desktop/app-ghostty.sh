# Description: Install Ghostty terminal emulator

# -- ---------------------------------------------------------------------------------------------------------
# Method 1 - Install via install script
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"

# --
# Method 2 - Install from .deb package

# Set some defaults
UBUNTU_VERSION=$(lsb_release -rs)
ARCH=$(dpkg --print-architecture)
#SUPPORTED_VERSIONS=("25.04" "24.04" "24.10")

cd /tmp
# Get the latest release info
#curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest > ghostty_release.json
# Find our Ubuntu version
#if [[ " ${SUPPORTED_VERSIONS[*]} " =~ " ${UBUNTU_VERSION} " ]]; then
if [[ "$UBUNTU_VERSION" =~ ^(25.04|24.10|24.04)$ ]]; then
  #DOWNLOAD_URL=$(jq -r '.assets[] | select(.name | contains("_'$ARCH'_'$UBUNTU_VERSION'.deb")) | .browser_download_url' ghostty_release.json)
  DOWNLOAD_URL=$(
    curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest | \
    grep -oP "https://github.com/mkasberg/ghostty-ubuntu/releases/download/[^\s/]+/ghostty_[^\s/_]+_${ARCH}_${UBUNTU_VERSION}.deb"
  )
else
  echo "Unsupported Ubuntu version ($UBUNTU_VERSION). Falling back to 24.04 (LTS) package."
  #DOWNLOAD_URL=$(jq -r '.assets[] | select(.name | contains("_'$ARCH'_24.04.deb")) | .browser_download_url' ghostty_release.json)
  DOWNLOAD_URL=$(
    curl -s https://api.github.com/repos/mkasberg/ghostty-ubuntu/releases/latest | \
    grep -oP "https://github.com/mkasberg/ghostty-ubuntu/releases/download/[^\s/]+/ghostty_[^\s/_]+_${ARCH}_24.04.deb"
  )
fi
# Download and install
wget -q "$DOWNLOAD_URL" -O ghostty.deb
sudo apt install -y ./ghostty.deb
rm ghostty.deb
#rm ghostty_release.json
cd -

# --
# Method 3 - Build from source (least recommended)
# mise use -g zig@0.14
# sudo apt install -y libgtk-4-dev libadwaita-1-dev git blueprint-compiler gettext
# cd /tmp
# git clone https://github.com/ghostty-org/ghostty
# cd ghostty
# zig build -p $HOME/.local -Doptimize=ReleaseFast
# cd -
# Update the application list
# sudo update-desktop-database

# -- ---------------------------------------------------------------------------------------------------------
# Install our Ghostty config
mkdir -p ~/.config/ghostty
cp "$PROJECT_ROOT"/configs/ghostty/config ~/.config/ghostty/config

# Make Ghostty the default terminal
if [[ "$UBUNTU_VERSION" == "24.04" ]] || [[ "$UBUNTU_VERSION" == "24.10" ]]; then
  # Setting the default terminal (system wide) prior to Ubuntu 25.04
  sudo update-alternatives --set x-terminal-emulator /usr/bin/ghostty
else
  # In Ubuntu 25.04 there are 3 possible places to set the default terminal:
  # 1. ubuntu-xdg-terminals.list – Checked first; highest precedence level. If valid terminal entry found, ignore all others.
  # 2. gnome-xdg-terminals.list – Checked next.
  # 3. xdg-terminals.list – Only use this configuration file when none of above works.
  # Now hitting Ctrl+Alt+T will open Ghostty as the default terminal.
  sed -i '1i com.mitchellh.ghostty.desktop' ~/.config/ubuntu-xdg-terminals.list
fi