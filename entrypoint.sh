#!/bin/bash

# =========================================================
# Configuration: Set the default model if not provided
# =========================================================
MODEL_NAME=${MODEL_NAME:-mistral:7b}
echo "Starting container and configuring to pull model: ${MODEL_NAME}"

# Start Ollama server in the background
ollama serve &

# Wait for the server to be ready
# Checking the API port is more reliable than a simple sleep
until curl --output /dev/null --silent --head http://localhost:11434; do
    printf '.'
    sleep 1
done
echo -e "\nOllama server is up and running!"

# Pull the desired model using the variable
echo "Pulling model: ${MODEL_NAME}"
ollama pull "${MODEL_NAME}"

# Start open-webui
echo "Starting Open-Webui"
open-webui serve

# Bring the background ollama serve process back to the foreground
# This ensures Docker keeps the container running and the primary process is maintained
wait -n