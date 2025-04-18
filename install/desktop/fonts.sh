# Description: Install preferred Fonts (TTF only)

cd /tmp

# JetBrainsMono Nerd Font
wget -O JetBrainsMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
unzip JetBrainsMono.zip -d JetBrainsMono
mkdir -p ~/.local/share/fonts/JetBrainsMono
cp JetBrainsMono/*.ttf ~/.local/share/fonts/JetBrainsMono/
rm -rf JetBrainsMono.zip JetBrainsMono

# Cascadia Code Nerd Font
wget -O CascadiaCode.zip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip"
unzip CascadiaCode.zip -d CascadiaCode
mkdir -p ~/.local/share/fonts/CascadiaCode
cp CascadiaCode/*.ttf ~/.local/share/fonts/CascadiaCode/
rm -rf CascadiaCode.zip CascadiaCode

# Update font cache
fc-cache

cd -
