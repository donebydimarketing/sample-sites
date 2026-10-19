#!/bin/sh
# Turn a phone video into scroll frames for this site.
# Usage: ./make_frames.sh my-walk-in-video.mp4
# Needs ffmpeg installed. This replaces the placeholder frames.
set -e
rm -rf frames && mkdir frames
ffmpeg -i "$1" -vf "fps=12,scale=1280:-2" -frames:v 150 -start_number 0 -c:v libwebp -quality 65 frames/f%03d.webp
echo "Frames made: $(ls frames | wc -l). Open index.html and set TOTAL to this number."
