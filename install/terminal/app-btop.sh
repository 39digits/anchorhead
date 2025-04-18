# Description: Install btop terminal resource monitor with the Catppuccin Latte theme

sudo apt install -y btop

mkdir -p "$HOME/.config/btop/themes"
curl -o "$HOME/.config/btop/themes/catppuccin_latte.theme" https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_latte.theme
# Set the colour theme in btop.conf
sed -i "s|^color_theme.*|color_theme = \"$HOME/.config/btop/themes/catppuccin_latte.theme\"|" "$HOME/.config/btop/btop.conf"
