#!/bin/bash

# Function to create directories if they don't exist
create_directory() {
    if [ ! -d "$1" ]; then
        mkdir "$1"
    fi
}

# Function to organize files based on their extensions
organize_files() {
    local target_dir="$1"
    
    # Check if the target directory exists
    if [ ! -d "$target_dir" ]; then
        echo "Error: The target directory does not exist."
        exit 1
    fi
    
    # Move to the target directory
    cd "$target_dir" || exit 1

    # Create the necessary directories if they don't exist
    create_directory "Pictures"
    create_directory "Music"
    create_directory "Documents"
    create_directory "Videos"
    create_directory "Misc"

    # Loop through each file in the current directory
    for file in *; do
        if [ -f "$file" ]; then
            # Get the file extension
            extension="${file##*.}"
            
            # Move the file to the appropriate directory based on the extension
            case "$extension" in
                jpg|jpeg|png|gif)
                    echo "Moving $file to Pictures folder"
                    mv "$file" "Pictures/"
                    ;;
                mp3|wav|flac)
                    echo "Moving $file to Music folder"
                    mv "$file" "Music/"
                    ;;
                pdf|doc|docx|txt)
                    echo "Moving $file to Documents folder"
                    mv "$file" "Documents/"
                    ;;
                mp4|avi|mkv|mov)
                    echo "Moving $file to Videos folder"
                    mv "$file" "Videos/"
                    ;;
                *)
                    echo "Moving $file to Misc folder"
                    mv "$file" "Misc/"
                    ;;
            esac
        fi
    done

    echo "File organization complete!"
}

# Check if the user provided a target directory argument
if [ "$#" -eq 0 ]; then
    # No argument provided, use the current directory
    target_directory="."
else
    target_directory="$1"
fi

organize_files "$target_directory"
