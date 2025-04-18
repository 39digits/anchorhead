# Description: Install Rust programming language via rustup

# Check if Rust is already installed
if command -v rustc &> /dev/null && command -v cargo &> /dev/null; then
    echo "Updating Rust..."
    rustup update
else
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
    # bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
    # Make rustup available in the current shell
    source "$HOME/.cargo/env"
    # Install rust analyzer (required for NeoVim LSP)
    rustup component add rust-analyzer
fi