#!/bin/bash

# Preguntar la URL del canal de Youtube
read -p "Ingresa la URL del canal de Youtube: " youtube_url

# Extraer el ID del video en vivo
video_id=$(curl -s $youtube_url | grep -o -m 1 'data-video-id="[a-zA-Z0-9_-]\+"' | sed -e 's/data-video-id="//g' -e 's/"//g')

# Preguntar la clave de Twitch
read -p "Ingresa la clave de transmisión de Twitch: " twitch_key

# Crear un nombre aleatorio para el contenedor Docker
container_name="youtube-to-twitch-$(date +%s)"

# Crear la imagen de Docker
docker build -t youtube-to-twitch .

# Ejecutar el contenedor Docker con la transmisión en vivo
docker run -it --rm --name $container_name youtube-to-twitch "$video_id" "$twitch_key"

# Abrir el navegador cada minuto
while true; do
  sleep 60
  xdg-open "https://www.twitch.tv/clave_de_transmision_de_twitch"
done
