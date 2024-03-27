#!/usr/bin/env bash

# Directory containing the videos
DIR="."

# Loop through all mp4 files in the directory
for file in "$DIR"/*.mp4
do
  # Check if the file is a regular file
  if [[ -f "$file" ]]
  then
    # Temporary output file name
    temp="${file}.temp.mp4"

    # Crop the video
    ffmpeg -i "$file" -filter:v "crop=in_w-324:in_h:324:0" "$temp"

    # Replace the original file with the cropped one
    mv "$temp" "$file"
  fi
done
