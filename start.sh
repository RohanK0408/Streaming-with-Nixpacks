#!/bin/bash
echo "Starting livestream with FFmpeg..."

ffmpeg -re -i "$SONG_URL" \
  -f lavfi -i anullsrc=r=44100:cl=stereo \
  -shortest \
  -c:v libx264 -preset veryfast -maxrate 3000k -bufsize 6000k \
  -c:a aac -b:a 128k -ar 44100 \
  -f flv "$RTMP_URL/$STREAM_KEY"
