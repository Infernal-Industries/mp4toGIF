#!/bin/bash

# Define the directories
PROJECT_DIR=$(pwd)
VENV_DIR="$PROJECT_DIR/venv"
REQUIREMENTS_FILE="$PROJECT_DIR/requirements.txt"
SCRIPT_FILE="$PROJECT_DIR/convert_videos_to_gifs.py"

# Create a virtual environment
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists."
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

# Upgrade pip
echo "Upgrading pip..."
python -m pip install --upgrade pip

# Install dependencies
if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install -r "$REQUIREMENTS_FILE"
else
    echo "requirements.txt not found!"
    exit 1
fi

# Run the Python script
if [ -f "$SCRIPT_FILE" ]; then
    echo "Running convert_videos_to_gifs.py..."
    python "$SCRIPT_FILE"
else
    echo "convert_videos_to_gifs.py not found!"
    exit 1
fi

# Deactivate the virtual environment
echo "Deactivating virtual environment..."
deactivate

echo "Setup and script execution completed."