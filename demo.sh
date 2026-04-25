#!/bin/bash

sudo dnf update -y

FIRST_PWD=$(pwd)

# Creando carpeta nextcloud
mkdir ~/nextcloud
cd ~/nextcloud

# Creando carpetas para almacenamiento de datos
mkdir cloud db

# Instalando docker
sudo dnf install docker -y
sudo systemctl start docker
sudo systemctl enable docker

# Instalando docker-compose
sudo mkdir -p /usr/libexec/docker/cli-plugins/
sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) -o/usr/libexec/docker/cli-plugins/docker-compose
sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose

docker compose version

cd $FIRST_PWD
sudo docker compose up -d

