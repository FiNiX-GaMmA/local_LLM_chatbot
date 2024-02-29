#!/bin/bash

# Ensure the script is executed with root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Set non-interactive frontend to avoid prompts from apt-get
export DEBIAN_FRONTEND=noninteractive

# Update system and install necessary packages
echo "Updating the system to eanle downloads"
apt-get update && apt-get install -y curl python3-pip

# Attempt to install ollama if it's not already installed
if ! command -v ollama >/dev/null 2>&1; then
    echo "ollama is not installed. Installing now."
    curl -fsSL https://ollama.com/install.sh | sh
    ollama serve
fi

# Check if ollama is installed after the installation attempt
if command -v ollama >/dev/null 2>&1; then
    echo "Starting ollama service and pulling llama2."

    ollama pull llama2
else
    echo "Installation failed. ollama could not be installed."
    exit 1
fi