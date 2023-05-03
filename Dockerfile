FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    ffmpeg \
    python3 \
    python3-pip

RUN pip3 install --upgrade pip
RUN pip3 install streamlink

WORKDIR /app
COPY test.sh /app/

CMD ["/bin/bash", "/app/test.sh"]
