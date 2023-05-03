#!/bin/bash

while true
do
    # Solicitar la URL del canal de YouTube al usuario
    read -p "Ingresa la URL del canal de YouTube: " youtube_url

    # Obtener la URL de la última transmisión
    stream_url=$(streamlink --stream-url $youtube_url best)

    # Solicitar la clave de transmisión de Twitch al usuario
    read -p "Ingresa la clave de transmisión de Twitch: " twitch_key

    # Construir el comando de transmisión utilizando streamlink y ffmpeg
    command="streamlink -O ${stream_url} best | ffmpeg -i - -c:v libx264 -preset veryfast -maxrate 2500k -bufsize 5000k -g 50 -c:a aac -b:a 128k -ar 44100 -f flv \"rtmp://live.twitch.tv/app/${twitch_key}\""

    # Ejecutar el comando en la terminal
    eval "$command"

    sleep 300 # Esperar 5 minutos antes de obtener la nueva URL de transmisión
done
