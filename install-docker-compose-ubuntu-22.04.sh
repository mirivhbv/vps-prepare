#!/bin/bash

# Update package list and install prerequisites
sudo apt-get update
sudo apt-get install -y curl jq

# Get the latest version of Docker Compose
COMPOSE_LATEST_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')

# Download the Docker Compose binary
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_LATEST_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

# Verify the installation
docker-compose --version

echo "Docker Compose version ${COMPOSE_LATEST_VERSION} installed successfully."
