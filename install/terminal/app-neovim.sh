# Description: Install Neovim and LazyVim

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim

# Install luarocks and tree-sitter-cli to resolve lazyvim :checkhealth warnings
sudo apt install -y luarocks tree-sitter-cli
# And some recommended dependencies for LazyVim
#  * fzf - fuzzy finder used by some plugins
#  * ripgrep - fast text search used by plugins (e.g. Telescope)
#  * fd-find - fuzzy finder (also used by Telescope)
sudo apt install -y ripgrep fd-find fzf

# Only attempt to set configuration if Neovim has never been run
if [ ! -d "$HOME/.config/nvim" ]; then
  # Install LazyVim and the starter template
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  # Remove the .git folder, so you can add it to your own repo later
  rm -rf ~/.config/nvim/.git

  # Install the themes and plugins
  cp "$PROJECT_ROOT"/configs/neovim/plugins/theme-zenbones.lua ~/.config/nvim/lua/plugins/theme-zenbones.lua
fi
