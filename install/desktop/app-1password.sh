# Description:  Install 1password and 1password-cli

# Source: https://support.1password.com/install-linux/#debian-or-ubuntu

# Add the key for 1Password apt repository
curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

# Add apt repository
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

# Add the debsig-verify policy
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

# Install 1Password & 1password-cli
sudo apt update && sudo apt install -y 1password 1password-cli

# Note: We do not use Snap or Flatpak as those come with limitations.
# Snap/Flatpack has all the features 1Password for Linux has to offer except:
#   - Need to lock and unlock 1Password in your browser separately from the app.
#   - Won’t be able to unlock 1Password or 1Password CLI with system authentication.
#   - Won’t be able to use the SSH agent.