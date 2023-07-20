#!/bin/bash

# Check if ffmpeg is installed
command -v ffmpeg >/dev/null 2>&1 || { echo >&2 "ffmpeg is required but it's not installed. Exiting."; exit 1; }

# Check input arguments
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <input_video> [output_gif]"
    exit 1
fi

INPUT_VIDEO="$1"

# Check if output name is provided
if [ "$#" -eq 2 ]; then
    OUTPUT_GIF="$2"
else
    # Use the input name but change extension to .gif
    OUTPUT_GIF="${INPUT_VIDEO%.*}.gif"
fi

# Convert video to gif
ffmpeg -i "$INPUT_VIDEO" "$OUTPUT_GIF"

echo "Conversion completed: $OUTPUT_GIF"
