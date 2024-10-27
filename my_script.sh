#!/bin/bash

# Author: Sokolchuk Oleksii
# Group: IO-25
# V = 2528 % 6 = 2

# Specify the target directory
TARGET_DIR="$HOME/SP/test_directory"

# Loop through the contents of the target directory
for item in "$TARGET_DIR"/*; do
    if [ -d "$item" ]; then
        # If the item is a directory, output a message
        echo "$(basename "$item") is a directory."
    elif [ -f "$item" ]; then
        # If the item is a file, create a new directory for it
        filename=$(basename "$item")
        new_dir="${TARGET_DIR}/${filename}_dir"
        mkdir -p "$new_dir"
       
        # Move the file into the newly created directory
        mv "$item" "$new_dir/"
        echo "$filename has been moved to $new_dir."
    fi
done
