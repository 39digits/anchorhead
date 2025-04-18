# Description: Install PostgreSQL as a Docker container
sudo docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres17 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:17
