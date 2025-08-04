#!/bin/sh

echo "Starting livestream with FFmpeg..."
ffmpeg -re -i "$SONG_URL" -f lavfi -i anullsrc -shortest -c:a aac -b:a 192k -f flv "$RTMP_URL/$STREAM_KEY"
