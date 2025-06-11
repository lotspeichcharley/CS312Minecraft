#!/bin/bash

apt update -y
apt upgrade -y
apt install docker.io docker-compose -y

usermod -aG docker ubuntu
newgrp docker

mkdir -p /opt/minecraft
cd /opt/minecraft

cat <<EOF > docker-compose.yml
version: "3"
services:
  mc:
    image: itzg/minecraft-server:java21
    ports:
      - "25565:25565"
    environment:
      EULA: "TRUE"
    tty: true
    stdin_open: true
    restart: unless-stopped
    volumes:
      - ./minecraft-data:/data
EOF

docker compose up -d
echo "Minecraft server setup complete. You can access it at your server's IP address on port 25565."