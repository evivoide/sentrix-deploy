#!/bin/bash

echo "📦 Installing Sentrix..."

# Install system packages
sudo apt update
sudo apt install -y python3 python3-pip python3-venv screen git

# Create Sentrix directory
mkdir -p ~/sentrix && cd ~/sentrix

# Clone from GitHub
git clone https://github.com/evivoide/sentrix-deploy.git . || echo "Repo already cloned."

# Setup virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Python packages
pip install --upgrade pip
pip install -r requirements.txt

# Launch app in background
screen -dmS sentrix bash -c 'cd ~/sentrix && source venv/bin/activate && python3 app.py'

echo "✅ Sentrix is running in a screen session: screen -r sentrix"
