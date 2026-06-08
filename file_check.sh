#!/bin/bash

read -p "Enter the complete path of the file" FILE

# -f checks if the file exists and is a regular file
if [ -f "$FILE" ]
then
    echo "The file exists!"
else
    echo "File not found or it is a directory."
fi
