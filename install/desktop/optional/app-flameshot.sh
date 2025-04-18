#!/bin/bash
# Description: Install Flameshot - a screenshot tool with more features than the default Gnome screenshot tool

# NOTE: Flameshot does not support Wayland so there are some caveats.
# For example, you cannot run it directly but have to do it via a specific command.
# As such the default shortcut for the screenshot tool will not work.

# ---------------------------------------------------------------------------------------
sudo apt install -y flameshot
# ---------------------------------------------------------------------------------------
# We have already set some custom keybindings in our `gnome-hotkeys.sh` script.
# So we need to add our new keybinding to the existing list of custom keybindings
# without overwriting the existing ones.

# Path for the new custom keybinding
NEW_KEYBINDING='/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/'
# Get current list of custom keybindings
CURRENT_KEYBINDINGS=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
# Remove the enclosing brackets for processing
CURRENT_KEYBINDINGS=${CURRENT_KEYBINDINGS:1:${#CURRENT_KEYBINDINGS}-2}

# Check if the list is empty
if [ -z "$CURRENT_KEYBINDINGS" ]; then
  # If empty, create a new list with just our keybinding
  NEW_LIST="['$NEW_KEYBINDING']"
else
  # If not empty, append our keybinding
  NEW_LIST="[${CURRENT_KEYBINDINGS}, '$NEW_KEYBINDING']"
fi

# Set the updated list of keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$NEW_LIST"

# Set flameshot (with the sh fix for starting under Wayland) on alternate print screen key
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/ name 'Flameshot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/ command 'sh -c -- "flameshot gui"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/flameshot/ binding '<Control>Print'

echo "Added new keybinding: $NEW_KEYBINDING"
echo "Updated keybindings list: $NEW_LIST"
# ---------------------------------------------------------------------------------------
# App doesn't do anything when started from the app grid due to lack of Wayland support
sudo rm -rf /usr/share/applications/org.flameshot.Flameshot.desktop