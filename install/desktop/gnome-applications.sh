# Description: Install various GNOME .desktop settings

# Create folders in App Grid
# gsettings set org.gnome.desktop.app-folders folder-children "['Utilities', 'Sundry', 'YaST', 'Updates', 'Xtra']"
# gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Updates/ name 'Install & Update'
# gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Updates/ apps "['org.gnome.Software.desktop', 'software-properties-drivers.desktop', 'software-properties-gtk.desktop', 'update-manager.desktop', 'firmware-updater_firmware-updater.desktop', 'snap-store_snap-store.desktop']"
# gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ name 'Xtra'
# gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ apps "['gnome-language-selector.desktop', 'org.gnome.PowerStats.desktop', 'yelp.desktop']"


# Create the directories for the .desktop files and icons
mkdir -p ~/.local/share/applications
mkdir -p ~/.local/share/icons

# -------------------------------------------------------------------
# Neovim
# Replace desktop launcher with one running inside our terminal
sudo rm -rf /usr/share/applications/nvim.desktop

cat <<EOF >~/.local/share/applications/Neovim.desktop
[Desktop Entry]
Name=Neovim
GenericName=Text Editor
Comment=Edit text files
Exec=ghostty --class=Neovim --title=Neovim -e nvim "%F"
Terminal=false
Type=Application
Keywords=Text;editor;
Icon=nvim
Categories=Utility;TextEditor;
StartupNotify=false
EOF
# MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;

# -------------------------------------------------------------------
# Docker
cp "$PROJECT_ROOT"/assets/icons/docker.png ~/.local/share/icons/docker.png

cat <<EOF >~/.local/share/applications/Docker.desktop
[Desktop Entry]
Version=1.0
Name=Docker
Comment=Manage Docker containers with LazyDocker
Exec=ghostty --class=Docker --title=Docker -e lazydocker
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/icons/docker.png
Categories=GTK;
StartupNotify=false
EOF
#Exec=alacritty --config-file /home/$USER/.local/share/omakub/defaults/alacritty/pane.toml --class=Docker --title=Docker -e lazydocker

# -------------------------------------------------------------------
# Activity Monitor (btop)
# Remove Btop entry for one that runs in ghostty
sudo rm -rf /usr/share/applications/btop.desktop

cp "$PROJECT_ROOT"/assets/icons/activity.png ~/.local/share/icons/activity.png

cat <<EOF >~/.local/share/applications/Activity.desktop
[Desktop Entry]
Version=1.0
Name=Activity
GenericName=System Monitor
Comment=System activity from btop
Exec=ghostty --class=Activity --title=Activity -e btop
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/icons/activity.png
Categories=System;Monitor;ConsoleOnly;
Keywords=system;process;task
StartupNotify=false
EOF
# Exec=alacritty --config-file /home/$USER/.local/share/omakub/defaults/alacritty/btop.toml --class=Activity --title=Activity -e btop