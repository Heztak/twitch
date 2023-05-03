#!/bin/bash

# Preguntar por la URL del canal de YouTube y la clave de Twitch
read -p "Ingrese la URL del canal de YouTube: " youtube_url
read -p "Ingrese la clave de Twitch: " twitch_key

# Obtener el nombre del canal de YouTube
channel_name=$(youtube-dl --get-filename -o '%(uploader)s' $youtube_url)

# Construir la imagen de Docker
sudo docker build -t youtube-to-twitch .

# Ejecutar el contenedor de Docker
sudo docker run -it --rm --name $channel_name -e YOUTUBE_URL=$youtube_url -e TWITCH_KEY=$twitch_key youtube-to-twitch
