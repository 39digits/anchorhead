# Description: Install Musikcube, a terminal-based music player

# Get the latest release info from GitHub API and parse with jq
LATEST_RELEASE=$(curl -s https://api.github.com/repos/clangen/musikcube/releases/latest | jq -r '.assets[] | select(.name | test("linux_x86_64.deb$")) | .browser_download_url')

cd /tmp
wget "$LATEST_RELEASE" -O musikcube.deb
sudo apt-get install -y ./musikcube.deb
rm musikcube.deb
cd -
