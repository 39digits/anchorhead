# Description: Install Bruno REST API client

sudo snap install bruno

# Alternative method:
# Flatpak version was not starting (2025-04-04)
# flatpak install flathub com.usebruno.Bruno

# The apt method will always issue a warning during `apt update` due to i386 incompatibility
# which is an annoying warning to always see that's another reason why we use the snap method instead.
# Prerequisites due to a permissions issue with GPG:
# sudo apt-get install -y dirmngr
# sudo mkdir -p /root/.gnupg
# sudo chmod 700 /root/.gnupg
# Actual install steps begin here:
# sudo mkdir -p /etc/apt/keyrings
# sudo gpg --no-default-keyring --keyring /etc/apt/keyrings/bruno.gpg --keyserver keyserver.ubuntu.com --recv-keys 9FA6017ECABE0266
# echo "deb [signed-by=/etc/apt/keyrings/bruno.gpg] http://debian.usebruno.com/ bruno stable" | sudo tee /etc/apt/sources.list.d/bruno.list
# sudo apt update
# sudo apt install -y bruno
