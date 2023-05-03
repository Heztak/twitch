import os
import time
import webbrowser
import streamlink

youtube_url = input("Ingrese la URL del canal de Youtube: ")
twitch_key = input("Ingrese la clave de stream de Twitch: ")

while True:
    streams = streamlink.streams(youtube_url)
    if "best" in streams:
        stream_url = streams["best"].url
        break
    else:
        print("El canal de Youtube no está disponible en este momento. Intentando de nuevo en 60 segundos...")
        time.sleep(60)

stream_key = twitch_key.split("_")[-1]

cmd = f'streamlink --hls-segment-threads 4 -O "{stream_url}" best | ffmpeg -nostdin -r 25 -i - -c:v libx264 -preset veryfast -maxrate 1984k -bufsize 3968k -g 50 -c:a aac -b:a 128k -ar 44100 -f flv "rtmp://live.twitch.tv/app/{stream_key}"'
os.system(cmd)

webbrowser.open_new_tab("http://www.twitch.tv/dashboard/live")
time.sleep(60)
