FROM python:3.9-slim

RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

RUN pip install streamlink

WORKDIR /app

COPY stream.py .

ENTRYPOINT ["python", "/app/stream.py"]
