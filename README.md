# Ollama-Local-Docker

This project sets up Ollama, Open WebUI, and model loading within a Docker container.

## Features

* **Ollama**: Runs the Ollama server, enabling local LLM inference.
* **Open WebUI**: Provides a user-friendly web interface for interacting with your models.
* **Model Loading**: Automatically pulls a specified model on container startup.
* **Customizable**: Easily configure the model to load and the ports used.

## Usage

1. **Build the Docker image:**

```
cd Ollama-Local-Docker
docker build --platform=linux/amd64 -t <docker-user>/mistral-rag:latest .
docker push <docker-user>/mistral-rag:latest
```

or use: `docker pull pfh42/ollama-local:latest`

https://hub.docker.com/repository/docker/pfh42/ollama-local/general

1. **Deploy docker image:**

```
services:
  ollama-local:
    image: pfh42/ollama-local:latest
    container_name: ollama-local
    ports:
      - 8080:8080
      - 11434:11434
    expose:
      - 8080
      - 11424
    platform: linux/amd64
    environment:
      - MODEL_NAME=mistral:7b
```

2. **Access the WebUI:**

Open your browser and navigate to `http://localhost:8080` to interact with the Open WebUI.

## Configuration

* **Model**: Modify the `MODEL_NAME` environment variable in the Dockerfile to specify a different model.

## Python integration

Check `test.py` file for a simple example of how to interact with the Ollama server.
