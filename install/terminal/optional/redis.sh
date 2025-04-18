# Description: Install Redis as a Docker container
sudo docker run -d --restart unless-stopped -p "127.0.0.1:6379:6379" --name=redis redis:7
