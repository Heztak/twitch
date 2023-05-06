#!/bin/bash

read -p "Ingrese la URL del canal de YouTube (ejemplo: https://www.youtube.com/@YellowBrickCinema): " youtube_channel_url
read -p "Ingrese su clave de transmisión de Twitch: " twitch_key
read -p "Ingrese un nombre para el contenedor (dejar en blanco para un nombre aleatorio): " container_name
read -p "Ingrese un nombre para la sesión de screen (ejemplo: yt-to-twitch): " screen_name

if [ -z "$screen_name" ]; then
  screen_name="youtube-to-twitch"
  echo "Usando el nombre de sesión predeterminado: $screen_name"
else
  echo "Usando el nombre de sesión personalizado: $screen_name"
fi

if [ -z "$container_name" ]; then
  echo "Usando un nombre de contenedor aleatorio."
  screen -S "$screen_name" -dm bash -c "docker run -e YOUTUBE_CHANNEL_URL='$youtube_channel_url' -e TWITCH_KEY='$twitch_key' youtube-to-twitch"
else
  echo "Usando el nombre de contenedor personalizado: $container_name"
  screen -S "$screen_name" -dm bash -c "docker run -e YOUTUBE_CHANNEL_URL='$youtube_channel_url' -e TWITCH_KEY='$twitch_key' --name '$container_name' youtube-to-twitch"
fi

echo "El script se está ejecutando en una sesión de screen llamada '$screen_name'."
echo "Para ver la sesión de screen en tiempo real, ejecute: screen -r $screen_name"
echo "Para desprenderse de la sesión de screen y dejarla ejecutándose en segundo plano, presione Ctrl + A seguido de Ctrl + D."
