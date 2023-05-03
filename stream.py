import os
import sys
import time
import streamlink
import subprocess

if len(sys.argv) < 3:
    print('Usage: python stream.py <YouTube URL> <Twitch Stream Key>')
    sys.exit(1)

url = sys.argv[1]
twitch_key = sys.argv[2]

streams = streamlink.streams(url)
if not streams:
    print(f'Unable to find streams from {url}')
    sys.exit(1)

stream = streams['best']
print(f'Stream URL: {stream.url}')
print(f'Starting ffmpeg process to stream to Twitch with key: {twitch_key}')

cmd = (f'ffmpeg -re -i {stream.url} -c:v libx264 -preset veryfast -maxrate 3500k -bufsize 4000k -vf scale=1280x720 -r 25 -g 50 -c:a aac -b:a 128k -ar 44100 -f flv rtmp://live.twitch.tv/app/{twitch_key}').split(' ')
p = subprocess.Popen(cmd)

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    print('Stopping ffmpeg process')
    p.kill()
    sys.exit(0)
