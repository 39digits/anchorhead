# Description: Install and setup ZSH with oh-my-zsh

sudo apt install -y zsh

# ----------------------------------------------------------------------
# Install Oh My Zsh

# If you're running the Oh My Zsh install script as part of an automated install,
# you can pass the --unattended flag to the install.sh script. This will have the
# effect of not trying to change the default shell, and it also won't run zsh when
# the installation has finished.
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

mkdir -p ~/.oh-my-zsh/custom/plugins
cp "$PROJECT_ROOT"/configs/zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
# Install the plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Ensure the default shell is set to zsh
sudo chsh -s $(which zsh) $(whoami)

# ----------------------------------------------------------------------
# Install the Starship prompt

curl -sS https://starship.rs/install.sh | sh
# Add the Starship initialization to the bottom of our zshrc file
#echo -e "\n# Initialize Starship\neval \"$(starship init zsh)\"" >> ~/.zshrc
# (Already in the zshrc file)

# Install the Starship prompt configuration
mkdir -p ~/.config
[ -f "~/.config/starship.toml" ] && mv ~/.config/starship.toml ~/.config/starship.toml.bak
cp "$PROJECT_ROOT"/configs/zsh/starship.toml ~/.config/starship.toml


# ----------------------------------------------------------------------
# Copy ZSH configuration files
[ -f "~/.zshrc" ] && mv ~/.zshrc ~/.zshrc.bak
cp "$PROJECT_ROOT"/configs/zsh/zshrc ~/.zshrc
[ -f "~/.zshenv" ] && mv ~/.zshenv ~/.zshenv.bak
cp "$PROJECT_ROOT"/configs/zsh/zshenv ~/.zshenv
