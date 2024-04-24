#!/bin/bash

# Check if source and destination directories are provided as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Assign source and destination directories
source_dir="$1"
destination_dir="$2"

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Source directory does not exist!"
    exit 1
fi

# Check if destination directory exists, if not, create it
if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

# Create timestamp
timestamp=$(date +%Y%m%d_%H%M%S)

# Create compressed archive with timestamp in destination directory
archive_name="${source_dir##*/}_${timestamp}.tar.gz"  # Using source directory name in archive name
tar -czf "${destination_dir}/${archive_name}" -C "$source_dir" .

echo "Archive created: ${destination_dir}/${archive_name}"
