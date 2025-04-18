# Description: Install Spotify on Ubuntu
# Source: https://www.spotify.com/us/download/linux/

curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install -y spotify-client

# -- ------------------------------------------------
# Alternative method:
# flatpak install -y flathub com.spotify.Client
# Snap doesn't allow for Spicetify tweaks. So choose this last.
#sudo snap install spotify