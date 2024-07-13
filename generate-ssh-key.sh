#!/bin/bash

# Check if email parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 your_email@example.com [key_filename]"
  exit 1
fi

EMAIL=$1
KEY_FILENAME=${2:-id_ed25519}

# Generate SSH key
ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/$KEY_FILENAME -N ""

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add SSH private key to the ssh-agent
ssh-add ~/.ssh/$KEY_FILENAME

echo "SSH key generated with filename '$KEY_FILENAME' and added to ssh-agent successfully."
