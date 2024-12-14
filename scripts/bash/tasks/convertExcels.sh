#!/bin/bash

# Paths
CSV_FOLDER_PATH="/home/ubuntu/data-engineer-playground/data/outputs/converted/csv"
PYTHON_SCRIPT_PATH="/home/ubuntu/data-engineer-playground/transforms/convert_to_csv.py"

# Step 1: Clean the folder
echo "Cleaning folder: $CSV_FOLDER_PATH"
if [ -d "$CSV_FOLDER_PATH" ]; then
    rm -f "$CSV_FOLDER_PATH"/*
    echo "Folder cleaned successfully."
else
    echo "Folder does not exist. Creating it..."
    mkdir -p "$CSV_FOLDER_PATH"
    echo "Folder created successfully."
fi

# Step 2: Run the Python script
echo "Running Python script: $PYTHON_SCRIPT_PATH"
python3 "$PYTHON_SCRIPT_PATH"

# Check if the script ran successfully
if [ $? -eq 0 ]; then
    echo "Python script executed successfully."
else
    echo "Python script execution failed."
fi