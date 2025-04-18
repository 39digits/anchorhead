# Description: Install Microsoft Edge

# Ensure Microsoft's key is installed (may already exist so don't repeat)
if [ ! -f /usr/share/keyrings/microsoft.gpg ]; then
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
fi
# Add Edge repository if not already added
if [ ! -f /etc/apt/sources.list.d/microsoft-edge.list ]; then
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge.list > /dev/null
fi

# Install Edge
sudo apt update
sudo apt install -y microsoft-edge-stable
