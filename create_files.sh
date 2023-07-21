#!/bin/bash

# Function to create sample picture files
create_sample_picture_files() {
    echo "Creating sample picture files..."
    touch "file1.jpg"
    touch "file2.png"
    touch "file3.gif"
}

# Function to create sample music files
create_sample_music_files() {
    echo "Creating sample music files..."
    touch "song1.mp3"
    touch "song2.wav"
    touch "song3.flac"
}

# Function to create sample document files
create_sample_document_files() {
    echo "Creating sample document files..."
    touch "document1.pdf"
    touch "document2.doc"
    touch "document3.docx"
    touch "document4.txt"
}

# Function to create sample video files
create_sample_video_files() {
    echo "Creating sample video files..."
    touch "video1.mp4"
    touch "video2.avi"
    touch "video3.mkv"
    touch "video4.mov"
}

# Check if the user provided a target directory argument
if [ "$#" -eq 0 ]; then
    # No argument provided, use the current directory
    target_directory="."
else
    target_directory="$1"
fi

# Create sample files in the current directory
create_sample_picture_files
create_sample_music_files
create_sample_document_files
create_sample_video_files

echo "Sample files created successfully!"
