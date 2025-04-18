# Description: Install Zellij terminal multiplexer

cd /tmp
wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
tar -xf zellij.tar.gz zellij
sudo install zellij /usr/local/bin
rm zellij.tar.gz zellij
cd -

# PROJECT_ROOT is expected to be set by calling install script.
mkdir -p "$HOME/.config/zellij/themes"
cp "$PROJECT_ROOT/configs/zellij/config_locked.kdl" "$HOME/.config/zellij/config.kdl"
#cp "$PROJECT_ROOT/themes/nord/zellij.kdl" "$HOME/.config/zellij/themes/nord.kdl"