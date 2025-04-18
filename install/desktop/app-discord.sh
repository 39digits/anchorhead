# Description: Install Discord

cd /tmp
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo apt install -y ./discord.deb
cd -

#sudo snap install discord
# Flatpak version has file access, screensharing, and "Currently Playing" limitations. See GitHub for details.
# flatpak install flathub com.discordapp.Discord