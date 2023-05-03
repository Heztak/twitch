#!/bin/bash

# Preguntar la URL del canal de YouTube
read -p "Ingrese la URL del canal de YouTube: " youtube_url

# Preguntar la clave de Twitch
read -p "Ingrese la clave de Twitch: " twitch_key

# Descargar el archivo Dockerfile
wget https://raw.githubusercontent.com/Heztak/twitch/main/Dockerfile

# Descargar el archivo stream.py
wget https://raw.githubusercontent.com/Heztak/twitch/main/stream.py

# Instalar Docker si no está instalado
if ! command -v docker &> /dev/null
then
    echo "Docker no está instalado. Se instalará Docker ahora."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
fi

# Construir la imagen de Docker
docker build -t youtube-to-twitch .

# Obtener un puerto aleatorio para mapear al puerto 8080 del contenedor
port=$(shuf -i 8081-8180 -n 1)

# Ejecutar el contenedor de Docker
docker run -it --rm -p $port:8080 --name $(date +%s) youtube-to-twitch "$youtube_url" "$twitch_key"
