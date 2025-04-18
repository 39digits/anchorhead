# Description: This script installs Docker on Ubuntu and configures it for the current user.

# Check if Docker is already installed
if ! command -v docker &> /dev/null; then

    # Add the official Docker repository
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo wget -qO /etc/apt/keyrings/docker.asc https://download.docker.com/linux/ubuntu/gpg
    sudo chmod a+r /etc/apt/keyrings/docker.asc

# Check if this works on 25.04 Beta to install the previous repo
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#   noble stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Add Docker repository to sources
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update

    # Install Docker packages
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

    # Add current user to docker group if not already added
    sudo usermod -aG docker ${USER}

    # Configure log rotation if not already configured
    sudo mkdir -p /etc/docker
    echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

    echo "Docker installed. Log out and back in for group changes to take effect."
fi