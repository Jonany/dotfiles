#!/bin/bash


# Check if a directory path was provided
if [ $# -ne 2 ]; then
    notify-send --app-name="wallpaper" --urgency=critical -t 5000 "Usage: $0 '/path/to/image/folder' 'prefix-'"
    exit 1
fi

# Store the provided directory path
image_dir="$1"
image_prefix="$2"

# Check if the directory exists
if [ ! -d "$image_dir" ]; then
    notify-send --app-name="wallpaper" --urgency=critical -t 5000 "Directory '$image_dir' does not exist"
    exit 1
fi

# Find all images with dark- prefix and store them in an array
mapfile -t images < <(find "$image_dir" -type f -name "$image_prefix*.jpg" -o -name "$image_prefix*.png")

# Check if any matching images were found
if [ ${#images[@]} -eq 0 ]; then
    notify-send --app-name="wallpaper" --urgency=critical -t 5000 "No images with prefix '$image_prefix' found in '$image_dir'"
    exit 1
fi

# Select a random image from the array
random_image=${images[RANDOM % ${#images[@]}]}

# Set the wallpaper based on desktop environment

swaymsg output "*" bg "$random_image" fill

exit 0
