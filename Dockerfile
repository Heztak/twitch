FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y ffmpeg python3-pip && \
    pip3 install streamlink

COPY youtube-to-twitch.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/youtube-to-twitch.sh

ENTRYPOINT ["/usr/local/bin/youtube-to-twitch.sh"]
