# Description: Install Steam

# Source: https://store.steampowered.com/about/
cd /tmp
wget https://cdn.fastly.steamstatic.com/client/installer/steam.deb
sudo apt install -y ./steam.deb
rm steam.deb
cd -
# Upon first start you will be prompted to install:
# libc6:amd64 libc6:i386 libegl1:amd64 libegl1:i386 libgbm1:amd64 libgbm1:i386 libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 libgl1:amd64 libgl1:i386 steam-libs-amd64:amd64 steam-libs-i386:i386


# Alternative method:
# sudo snap install steam