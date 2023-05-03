FROM python:3.9-slim

RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get install -y curl && \
    apt-get install -y unzip && \
    apt-get clean

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY . /app/

CMD ["/bin/bash", "/app/script.sh"]
