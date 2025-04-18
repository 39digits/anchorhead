sudo apt install -y gnome-shell-extension-manager pipx
pipx install gnome-extensions-cli --system-site-packages
# dconf-editor lets you find the keys used for settings in GNOME
sudo apt install dconf-editor

# Turn on/off default Ubuntu extensions
gnome-extensions enable ubuntu-dock@ubuntu.com
gnome-extensions enable tiling-assistant@ubuntu.com
# Discord and Jetbrains Toolbox show in the AppIndicator
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions disable ding@rastersoft.com

# Install new extensions
# gext might not be in path yet so use the full path
~/.local/bin/gext install tactile@lundal.io
~/.local/bin/gext install just-perfection-desktop@just-perfection
~/.local/bin/gext install blur-my-shell@aunetx
# ~/.local/bin/gext install space-bar@luchrioh
~/.local/bin/gext install tophat@fflewddur.github.io
~/.local/bin/gext install AlphabeticalAppGrid@stuarthayhurst
~/.local/bin/gext install caffeine@patapon.info
~/.local/bin/gext install spotify-controls@Sonath21

# Compile gsettings schemas in order to be able to set them
sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
# sudo cp ~/.local/share/gnome-shell/extensions/space-bar\@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
# System Monitor:  sudo cp  /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/spotify-controls\@Sonath21/schemas/org.gnome.shell.extensions.spotify-controls.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 2
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 0
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile row-2 0
# Adds a pleasing gap around the window
gsettings set org.gnome.shell.extensions.tactile gap-size 14

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection animation 2
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false
gsettings set org.gnome.shell.extensions.just-perfection accessibility-menu false
# Straight to Desktop = 0;  Workspace Overview = 1;
gsettings set org.gnome.shell.extensions.just-perfection startup-status 0

# Configure Blur My Shell
# gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur true
# gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur true
# gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur true
#gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur true
#gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock override-background true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0

# Configure Space Bar
# gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
# gsettings set org.gnome.shell.extensions.space-bar.behavior always-show-numbers true
# gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
# gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
# gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat show-icons false
gsettings set org.gnome.shell.extensions.tophat use-system-accent true
gsettings set org.gnome.shell.extensions.tophat show-cpu false
gsettings set org.gnome.shell.extensions.tophat show-mem false
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat show-fs false
# gsettings set org.gnome.shell.extensions.tophat fs-display numeric
gsettings set org.gnome.shell.extensions.tophat show-net true
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits

# Configure AlphabeticalAppGrid
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'

# Spotify Controls
gsettings set org.gnome.shell.extensions.spotify-controls show-track-info true
gsettings set org.gnome.shell.extensions.spotify-controls show-playback-controls true
# gsettings set org.gnome.shell.extensions.spotify-controls position 'rightmost-left'
# gsettings set org.gnome.shell.extensions.spotify-controls controls-position 'left'
gsettings set org.gnome.shell.extensions.spotify-controls position 'leftmost-right'
gsettings set org.gnome.shell.extensions.spotify-controls controls-position 'right'

# GNOME settings
gsettings set org.gnome.shell.extensions.dash-to-dock always-center-icons true
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme false
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.8
gsettings set org.gnome.shell.extensions.dash-to-dock customize-alphas true
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
#gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 36
#gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 42
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock disable-overview-on-startup true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
#gsettings set org.gnome.shell.extensions.dash-to-dock min-alpha 0.3
#gsettings set org.gnome.shell.extensions.dash-to-dock max-alpha 0.6
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-always-in-the-edge true
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'DEFAULT'
# Disable using the Super+(0-9) keys to activate the first 10 applications in the dock
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
# If Super + (0-9) opens the first 10 applications when hot-keys disabled, run these:
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-1 "[]"
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-2 "[]"
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-3 "[]"
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-4 "[]"
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-5 "[]"
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-6 "[]"
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-7 "[]"
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-8 "[]"
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-9 "[]"
# gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-10 "[]"
# gsettings set org.gnome.shell.keybindings switch-to-application-1 "[]"
# gsettings set org.gnome.shell.keybindings switch-to-application-2 "[]"
# gsettings set org.gnome.shell.keybindings switch-to-application-3 "[]"
# gsettings set org.gnome.shell.keybindings switch-to-application-4 "[]"
# gsettings set org.gnome.shell.keybindings switch-to-application-5 "[]"
# gsettings set org.gnome.shell.keybindings switch-to-application-6 "[]"
# gsettings set org.gnome.shell.keybindings switch-to-application-7 "[]"
# gsettings set org.gnome.shell.keybindings switch-to-application-8 "[]"
# gsettings set org.gnome.shell.keybindings switch-to-application-9 "[]"

