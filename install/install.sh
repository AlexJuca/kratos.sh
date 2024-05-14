#!/bin/bash

# Check if the script is running on macOS
if [[ $(uname -s) != "Darwin" ]]; then
    echo "Error: This script is intended for macOS only."
    exit 1
fi

# Define the URL of the compressed binary
DOWNLOAD_URL="https://github.com/AlexJuca/kratos.sh/releases/download/v0.1.0/kratos-0.1.0.tar.gz"

# Define the installation directory
INSTALL_DIR="$HOME/bin"

# Check if curl is installed
if ! command -v curl &>/dev/null; then
    echo "Error: curl is required but not installed. Please install curl and try again."
    exit 1
fi

# Create the installation directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Create a temporary directory to download and extract the binary
TMP_DIR=$(mktemp -d)
if [ ! -d "$TMP_DIR" ]; then
    echo "Error: Failed to create temporary directory."
    exit 1
fi

# Download the compressed binary
echo "Downloading kratos binary..."
if ! curl -L "$DOWNLOAD_URL" -o "$TMP_DIR/kratos.tar.gz"; then
    echo "Error: Failed to download kratos binary."
    rm -rf "$TMP_DIR"
    exit 1
fi

# Extract the binary
echo "Extracting kratos binary..."
if ! tar -xf "$TMP_DIR/kratos.tar.gz" -C "$TMP_DIR/"; then
    echo "Error: Failed to extract kratos binary."
    rm -rf "$TMP_DIR"
    exit 1
fi

# Move the binary to the installation directory
echo "Installing kratos binary..."
if ! mv "$TMP_DIR/kratos" "$INSTALL_DIR/"; then
    echo "Error: Failed to install kratos binary."
    rm -rf "$TMP_DIR"
    exit 1
fi

# Clean up
rm -rf "$TMP_DIR"

# Add installation success message and PATH update instructions
echo "Kratos has been successfully installed to $INSTALL_DIR"
echo "You can now run 'kratos' from anywhere in the command line."

# Check if PATH includes ~/bin and provide instructions if not
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo "Note: The ~/bin directory is not in your PATH."
    echo "To ensure you can run kratos from anywhere, add the following line to your shell configuration file (e.g., ~/.bash_profile, ~/.bashrc, or ~/.zshrc):"
    echo "export PATH=\"$HOME/bin:\$PATH\""
    echo "After adding the line, reload your shell configuration by running:"
    echo "source ~/.bash_profile   # or source ~/.bashrc for Bash"
    echo "OR"
    echo "source ~/.zshrc            # for Zsh"
fi
