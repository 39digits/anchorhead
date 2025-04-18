# Description: Install btop terminal resource monitor with the Catppuccin Latte theme

sudo apt install -y btop

mkdir -p "$HOME/.config/btop/themes"

# Install base config (to allow us to set theme)
cp "$PROJECT_ROOT/configs/btop/btop.conf" "$HOME/.config/btop/btop.conf"

# Install the Catppuccin Latte theme
curl -o "$HOME/.config/btop/themes/catppuccin_latte.theme" https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_latte.theme
# Set the colour theme in btop.conf; Needs to be full home path so we cannot set it in the config file
sed -i "s|^color_theme.*|color_theme = \"$HOME/.config/btop/themes/catppuccin_latte.theme\"|" "$HOME/.config/btop/btop.conf"
