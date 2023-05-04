#!/bin/bash

# Check if Docker is installed and update it, or install it if it isn't
if command -v docker &> /dev/null
then
    echo "Docker is already installed. Updating..."
    sudo yum update -y docker-ce docker-ce-cli containerd.io
else
    echo "Docker is not installed. Installing..."
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install -y docker-ce docker-ce-cli containerd.io
fi

# Start and enable Docker
sudo systemctl start docker.service
sudo systemctl enable docker.service

# Add the current user to the docker group
sudo usermod -aG docker $(whoami)
