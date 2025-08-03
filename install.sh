#!/bin/bash

# Teamwork CLI Installation Script

set -e

echo "Installing Teamwork CLI..."

# Check if /usr/local/bin exists and is writable
if [ ! -d "/usr/local/bin" ]; then
    echo "Creating /usr/local/bin directory..."
    sudo mkdir -p /usr/local/bin
fi

# Copy script to /usr/local/bin
echo "Copying tw to /usr/local/bin..."
sudo cp tw /usr/local/bin/tw
sudo chmod +x /usr/local/bin/tw

# Copy .env.example to user's home as .tw.env if it doesn't exist
if [ ! -f "$HOME/.tw.env" ]; then
    echo "Copying .env.example to $HOME/.tw.env..."
    cp .env.example "$HOME/.tw.env"
    echo ""
    echo "✅ Installation complete!"
    echo ""
    echo "Next steps:"
    echo "1. Edit $HOME/.tw.env with your Teamwork credentials"
    echo "2. Run 'tw tasks' from any directory"
else
    echo ""
    echo "✅ Installation complete!"
    echo ""
    echo "Config file $HOME/.tw.env already exists."
    echo "Run 'tw tasks' from any directory"
fi