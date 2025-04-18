# Description: Install Visual Studio Code
# Source: https://code.visualstudio.com/docs/setup/linux

# Ensure Microsoft's key is installed (may already exist so don't repeat)
if [ ! -f /usr/share/keyrings/microsoft.gpg ]; then
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
fi

# Add VS Code repository if not already added
if [ ! -f /etc/apt/sources.list.d/vscode.list ]; then
    echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
fi

# Install VS Code
sudo apt update
sudo apt install -y code

mkdir -p ~/.config/Code/User
cp "$PROJECT_ROOT/configs/vscode.json" "$HOME/.config/Code/User/settings.json"

# Install default supported themes
code --install-extension 39digits.anchorage-vscode-theme
code --install-extension arcticicestudio.nord-visual-studio-code
# code --install-extension enkia.tokyo-night
# code --install-extension Catppuccin.catppuccin-vsc
