import os
import sys
import time
import random
import subprocess

import youtube_dl

# Obtiene la URL del canal de YouTube y la clave de transmisión de Twitch desde la entrada del usuario
yt_url = input("Ingrese la URL del canal de YouTube: ")
twitch_key = input("Ingrese la clave de Twitch: ")

# Genera un nombre aleatorio para el contenedor de Docker y el puerto
container_name = "twitch_" + str(random.randint(1000, 9999))
port = str(random.randint(10000, 65535))

# Descarga el video de YouTube
ydl_opts = {
    'format': 'bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]/best[height<=720][ext=mp4]+bestaudio[ext=m4a]',
    'outtmpl': 'video.mp4',
}
with youtube_dl.YoutubeDL(ydl_opts) as ydl:
    ydl.download([yt_url])

# Transmite el video a Twitch usando ffmpeg
cmd = "ffmpeg -re -i video.mp4 -c:v libx264 -preset veryfast -maxrate 2500k -bufsize 5000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 128k -ar 44100 -f flv rtmp://live.twitch.tv/app/" + twitch_key
process = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)

# Espera un minuto antes de abrir el navegador
time.sleep(60)
# Abre el navegador en la transmisión de Twitch
os.system("xdg-open https://www.twitch.tv/" + twitch_key)

# Espera a que la transmisión termine
try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    process.kill()
    sys.exit()
