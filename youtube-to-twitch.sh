#!/bin/bash

if [ -z "$YOUTUBE_CHANNEL_URL" ]; then
  echo "La variable de entorno YOUTUBE_CHANNEL_URL no está establecida."
  exit 1
fi

if [ -z "$TWITCH_KEY" ]; then
  echo "La variable de entorno TWITCH_KEY no está establecida."
  exit 1
fi

while true
do
  youtube_live_url=$(streamlink --stream-url "$YOUTUBE_CHANNEL_URL" best)
  if [ -z "$youtube_live_url" ]
  then
    echo "No se encuentra ninguna transmisión en vivo en el canal de YouTube proporcionado. Reintentando en 60 segundos..."
    sleep 60
  else
    echo "Transmitiendo en vivo desde YouTube a Twitch..."
    streamlink -O "$youtube_live_url" best | ffmpeg -i pipe:0 -vf "scale=-1:720,fps=25" -c:v libx264 -preset veryfast -b:v 2500k -maxrate 2500k -bufsize 5000k -g 50 -c:a aac -b:a 128k -f flv "rtmp://live.twitch.tv/app/$TWITCH_KEY"
    echo "La transmisión en vivo de YouTube ha finalizado. Esperando 60 segundos antes de volver a intentar la transmisión..."
    sleep 60
  fi
done
