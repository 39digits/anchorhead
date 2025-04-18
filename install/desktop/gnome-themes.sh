# Description: Update the look of various parts of GNOME

# GNOME colour scheme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-blue"
gsettings set org.gnome.desktop.interface accent-color "blue"
# gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# gsettings set org.gnome.desktop.interface gtk-theme "Yaru-blue-dark"

# Background
BACKGROUND_IMAGE="spacesuit.jpg"
BACKGROUND_IMAGE_PATH="$PROJECT_ROOT/assets/backgrounds/$BACKGROUND_IMAGE"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/$(echo $BACKGROUND_IMAGE | tr '/' '-')"

if [ ! -d "$BACKGROUND_DEST_DIR" ]; then mkdir -p "$BACKGROUND_DEST_DIR"; fi

[ ! -f $BACKGROUND_DEST_PATH ] && cp $BACKGROUND_IMAGE_PATH $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'

# TopHat
# Nord
gsettings set org.gnome.shell.extensions.tophat meter-fg-color "#208fe9"
# TokyoNight
# gsettings set org.gnome.shell.extensions.tophat meter-fg-color "#924d8b"
# Catppuccin
# gsettings set org.gnome.shell.extensions.tophat meter-fg-color "#e920a3"
# Rose Pine
# gsettings set org.gnome.shell.extensions.tophat meter-fg-color "#e92020"