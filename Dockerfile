FROM python:3.9-slim

RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY stream.py .

RUN pip install streamlink

ENTRYPOINT ["python", "/app/stream.py"]
