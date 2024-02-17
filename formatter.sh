#!/usr/bin/env bash

# Use this script to convert any video to a widely supported web format.

# Check if an input file was provided
if [ -z "$1" ]; then
  echo "No input file specified. Please provide the input file as an argument."
  exit 1
fi


# Variables
INPUT_FILE=$1
OUTPUT_FILE="${INPUT_FILE%.*}_FORMATTED.mp4"
DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 -i "$INPUT_FILE")

# Calculat the speed factor by which to accelerate the video to be 120 seconds. 
SPEED_PTS=$(echo "scale=2; 120/$DURATION" | bc)

# Convert the input video into a Twitter-friendly format
ffmpeg -i "$INPUT_FILE" \
       -pix_fmt yuv420p \
       -vcodec libx264 \
       -crf 18 \
       -preset slow \
       -acodec aac \
       -vf "setpts=$SPEED_PTS*PTS" \
       -b:v 8000k \
       -an \
       "$OUTPUT_FILE"     

# Replace the original file with the output (unsafe, comment to disable)
mv "$OUTPUT_FILE" "$INPUT_FILE" 
