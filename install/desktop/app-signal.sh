# Description: Install Signal Desktop
# Source: https://signal.org/download/linux/

# Install official public software signing key:
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
# Add repository to list of repositories:
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

rm signal-desktop-keyring.gpg

sudo apt update && sudo apt install -y signal-desktop

# Alternative method:
# flatpak install flathub org.signal.Signal