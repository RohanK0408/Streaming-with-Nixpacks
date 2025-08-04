#!/bin/bash

echo "Downloading from Google Drive..."
gdown "$SONG_URL" -O video.mp4

echo "Starting livestream with FFmpeg..."
ffmpeg -re -i video.mp4 \
  -c:v libx264 -preset veryfast -maxrate 3000k -bufsize 6000k \
  -c:a aac -b:a 128k -ar 44100 \
  -f flv "$RTMP_URL/$STREAM_KEY"
