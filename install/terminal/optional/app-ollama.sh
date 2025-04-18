curl -fsSL https://ollama.com/install.sh | sh


# TO TEST WHEN UBUNTU 25.04 IS RELEASED

# Either this: https://medium.com/@edu.ukulelekim/how-to-locally-deploy-ollama-and-open-webui-with-docker-compose-318f0582e01f

# or

# Give me detailed instructions to setup Ollama and Open WebUI on Ubuntu.I don't mind running Ollama locally (if that means it is easier to get access to full power of RTX 4090 and to let other apps like VSCode or NeoVim use it too) but am open to it running in Docker.I do want Open WebUI in Docker though to keep it isolated.I previously had issues where Open WebUI could not access the locally running Ollama instance despite Ollama working (I could install models and access localhost:11434 successfully)EditSetting Up Ollama and Open WebUI on Ubuntu
# I'll provide detailed instructions for setting up Ollama locally (to leverage your RTX 4090) and Open WebUI in Docker while ensuring they can communicate properly.
# Part 1: Installing Ollama Locally

# First, install Ollama using the official installation script:
# bashCopycurl -fsSL https://ollama.com/install.sh | sh

# Verify the installation:
# bashCopyollama --version

# Set up Ollama to use your RTX 4090:

# Ensure you have NVIDIA drivers installed:
# bashCopynvidia-smi

# If not installed, add the NVIDIA repository and install drivers:
# bashCopysudo add-apt-repository ppa:graphics-drivers/ppa
# sudo apt update
# sudo apt install nvidia-driver-545 nvidia-utils-545

# Install CUDA toolkit:
# bashCopysudo apt install nvidia-cuda-toolkit



# Start the Ollama service:
# bashCopyollama serve

# Pull a model to test (in a new terminal):
# bashCopyollama pull llama3

# Test the model:
# bashCopyollama run llama3 "Hello, how are you?"


# Part 2: Setting Up Open WebUI in Docker

# Install Docker if not already installed:
# bashCopysudo apt update
# sudo apt install apt-transport-https ca-certificates curl software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# sudo apt update
# sudo apt install docker-ce docker-compose

# Add your user to the Docker group to avoid using sudo:
# bashCopysudo usermod -aG docker $USER
# Log out and log back in for this to take effect.
# Create a Docker network for Ollama and Open WebUI to communicate:
# bashCopydocker network create ollama-network


# Part 3: Configuring Ollama for External Access
# To solve your previous issue where Open WebUI couldn't access local Ollama:

# Edit the Ollama service file to allow external connections:
# bashCopysudo systemctl stop ollama
# sudo mkdir -p /etc/systemd/system/ollama.service.d/

# Create an override file:
# bashCopysudo nano /etc/systemd/system/ollama.service.d/override.conf

# Add the following content:
# Copy[Service]
# Environment="OLLAMA_HOST=0.0.0.0:11434"

# Reload systemd and restart Ollama:
# bashCopysudo systemctl daemon-reload
# sudo systemctl start ollama


# Part 4: Running Open WebUI in Docker

# Create a docker-compose.yml file:
# bashCopymkdir -p ~/openwebui
# cd ~/openwebui
# nano docker-compose.yml

# Add the following content to docker-compose.yml:
# yamlCopyversion: '3'
# services:
#   open-webui:
#     image: ghcr.io/open-webui/open-webui:main
#     container_name: open-webui
#     volumes:
#       - ./open-webui-data:/app/backend/data
#     environment:
#       - OLLAMA_BASE_URL=http://host.docker.internal:11434
#       - WEBUI_AUTH=True
#     ports:
#       - "3000:8080"
#     restart: unless-stopped
#     extra_hosts:
#       - "host.docker.internal:host-gateway"

# Start the Open WebUI container:
# bashCopydocker-compose up -d

# Access Open WebUI at http://localhost:3000 in your browser.

# Part 5: Connecting to Locally Running Ollama
# If the host.docker.internal approach doesn't work, try these alternatives:

# Use your machine's actual IP address:

# Find your IP address:
# bashCopyip addr show | grep "inet " | grep -v 127.0.0.1

# Update the OLLAMA_BASE_URL in docker-compose.yml:
# yamlCopyenvironment:
#   - OLLAMA_BASE_URL=http://192.168.x.x:11434



# Use network_mode: "host" (alternative approach):
# yamlCopyversion: '3'
# services:
#   open-webui:
#     image: ghcr.io/open-webui/open-webui:main
#     container_name: open-webui
#     volumes:
#       - ./open-webui-data:/app/backend/data
#     environment:
#       - OLLAMA_BASE_URL=http://localhost:11434
#       - WEBUI_AUTH=True
#     network_mode: "host"
#     restart: unless-stopped

# Restart the container after making changes:
# bashCopydocker-compose down
# docker-compose up -d


# Troubleshooting
# If Open WebUI still cannot connect to Ollama:

# Check if Ollama is accessible from outside:
# bashCopycurl http://localhost:11434/api/tags

# Check firewall settings:
# bashCopysudo ufw status

# Allow the Ollama port if needed:
# bashCopysudo ufw allow 11434/tcp

# Check Docker logs:
# bashCopydocker logs open-webui

# Verify Ollama is running with the correct host settings:
# bashCopyps aux | grep ollama


# Let me know if you encounter any specific issues during setup, and I'll help troubleshoot them!