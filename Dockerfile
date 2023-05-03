FROM python:3.9-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg libavcodec-extra && \
    rm -rf /var/lib/apt/lists/*

RUN pip install streamlink==2.4.0

WORKDIR /app
COPY stream.py .

ENTRYPOINT ["python", "/app/stream.py"]
