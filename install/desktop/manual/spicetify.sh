#!/usr/bin/env bash
# -- ------------------------------------------------
# Description: Install spicetify, a tool to customize Spotify
# Spotify needs to be run at least once before it can be installed
# so we cannot automatically install it as part of the main install.

# Prerequisite:
# Set the prefs path:
# 1. Open ~/.config/spicetify/config-xpui.ini
# 2. Set: prefs_path = /home/$USER/.config/spotify/prefs
#sed -i 's|^prefs_path.*$|prefs_path             = '"$HOME"'/.config/spotify/prefs|' ~/.config/spicetify/config-xpui.ini

# Install Spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh

# Before applying Spicetify, you need to gain write permission on Spotify files, by running command:
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R
# The installation instructions for linux have you setting /usr/share/spotify and /usr/share/spotify/Apps/* permissions to 666.
# If preferred, we could setup a dedicated group for a tighter control.
#GROUP=melange
#sudo groupadd $GROUP
#sudo usermod -a -G $GROUP $USER
#sudo chgrp $GROUP /usr/share/spotify
#sudo chgrp -R $GROUP /usr/share/spotify/Apps
#sudo chmod 775 /usr/share/spotify
#sudo chmod 775 -R /usr/share/spotify/Apps
# Let group changes take effect this session so we can run spicetify
#newgrp $GROUP

# Install the themes
cd /tmp
git clone --depth=1 https://github.com/spicetify/spicetify-themes.git
cd spicetify-themes
cp -r * ~/.config/spicetify/Themes
# Not immediately in the path so we need to use the full path to the binary for this session
~/.spicetify/spicetify config current_theme text
# Weirdly, this isn't a light theme even though Latte is usually the light variant of Catppuccin
~/.spicetify/spicetify config color_scheme CatppuccinLatte
~/.spicetify/spicetify backup apply

# -- ------------------------------------------------
# Settings to change:
# "Show desktop notifications when the song changes" to OFF
# Streaming Quality to "Very High"
# Download Quality to "Very High"
#
# There is a strange render bug on the text versions of the themes on the home page.
# Apparently, the Experimental Feature: Enable carousels on home got toggled on from the latest update.
# Fix:
# - Click your Profile > Experimental Features
# - Disable "Enable carousels on home"


# -- ------------------------------------------------
# If we want a non-text light theme, we can install the official Catppuccin themes
# cd /tmp
# git clone https://github.com/catppuccin/spicetify.git catppuccin-spicetify
# cp -r catppuccin-spicetify/catppuccin ~/.config/spicetify/Themes/
# ~/.spicetify/spicetify config current_theme catppuccin
# # latte, frappe, macchiato, mocha
# ~/.spicetify/spicetify config color_scheme latte
# ~/.spicetify/spicetify config inject_css 1 inject_theme_js 1 replace_colors 1 overwrite_assets 1
# ~/.spicetify/spicetify backup apply
# cd -