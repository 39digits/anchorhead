# Description: Install Solaar to customise Logitech devices such as MX Master 3

sudo add-apt-repository -y ppa:solaar-unifying/stable
sudo apt update
sudo apt install -y solaar

# If also using logiops.d, then don't forget to install the dependencies:
# sudo apt install -y libglib2.0-dev