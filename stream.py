import os
import time
import subprocess
import youtube_dl

# Obtener la URL del canal de YouTube y la clave de Twitch
youtube_url = os.environ['YOUTUBE_URL']
twitch_key = os.environ['TWITCH_KEY']

# Obtener el nombre del canal de YouTube
channel_name = youtube_dl.YoutubeDL().extract_info(youtube_url, download=False)['uploader']

# Definir el comando de FFmpeg para transmitir el video
ffmpeg_command = f"ffmpeg -re -i $(youtube-dl -f 'best[height<=720]' -g {youtube_url}) -c:v copy -c:a aac -ar 44100 -f flv rtmp://live.twitch.tv/app/{twitch_key}"

# Transmitir el video a Twitch
while True:
    print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] Iniciando transmisión del canal de YouTube '{channel_name}' en Twitch")
    subprocess.run(ffmpeg_command, shell=True)
    print(f"[{time.strftime('%Y-%m-%d %H:%M:%S')}] La transmisión se detuvo, intentando de nuevo en 10 segundos")
    time.sleep(10)
