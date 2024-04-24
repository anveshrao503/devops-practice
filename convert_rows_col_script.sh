#!/bin/bash

# Check if filename is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

# Check if file exists
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

# Transpose rows into columns using awk
awk '
{
    for (i=1; i<=NF; i++) {
        if (NR == 1) {
            col[i] = $i;
        } else {
            col[i] = col[i] " " $i;
        }
    }
}
END {
    for (i=1; col[i] != ""; i++) {
        print col[i];
    }
}
' "$filename"
