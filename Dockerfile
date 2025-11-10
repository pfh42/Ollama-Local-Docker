# Use the official Ollama image as the base
FROM ollama/ollama:latest

# Set environment variables
# OLLAMA_HOST is critical for Ollama to listen on all interfaces inside the container
ENV OLLAMA_HOST=0.0.0.0
# MODEL_NAME is used by the entrypoint.sh script
ENV MODEL_NAME=mistral:7b
ENV WEBUI_AUTH=False

# Install system-level dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    python3 \
    python3-pip \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir open-webui --break-system-packages

# Expose the default Ollama port and the WebUI port
EXPOSE 11434
EXPOSE 8080

# The custom script that manages both services and pulls the model
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the custom script as the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# CMD is now just a placeholder since the ENTRYPOINT handles everything
CMD ["start"]