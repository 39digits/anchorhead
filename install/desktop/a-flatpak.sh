# Description: Install Flatpak and add Flathub repository

if ! command -v flatpak &> /dev/null; then
    sudo apt install -y flatpak gnome-software-plugin-flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi