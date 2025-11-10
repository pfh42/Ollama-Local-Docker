# Webui-Ollama-Docker

This project sets up Ollama, Open WebUI, and model loading within a Docker container.

## Features

* **Ollama**: Runs the Ollama server, enabling local LLM inference.
* **Open WebUI**: Provides a user-friendly web interface for interacting with your models.
* **Model Loading**: Automatically pulls a specified model on container startup.
* **Customizable**: Easily configure the model to load and the ports used.

## Usage

1. **Build the Docker image:**

```
cd Webui-Ollama-Docker
docker buildx build --platform=linux/amd64,linux/arm64 -t <docker-user>/webui-ollama:latest .
docker push <docker-user>/webui-ollama:latest
```

or use: `docker pull pfh42/webui-ollama:latest`

https://hub.docker.com/repository/docker/pfh42/webui-ollama/general

1. **Deploy docker image:**

```
services:
  webui-ollama:
    image: pfh42/webui-ollama:latest
    container_name: webui-ollama
    ports:
      - 8080:8080
      - 11434:11434
    expose:
      - 8080
      - 11424
    environment:
      - MODEL_NAME=mistral:7b
```

2. **Access the WebUI:**

Open your browser and navigate to `http://localhost:8080` to interact with the Open WebUI.

## Configuration

* **Model**: Modify the `MODEL_NAME` environment variable in the Dockerfile to specify a different model.
* **WEBUI_AUTH**: Modify the `WEBUI_AUTH` to **True**  if you want to setup admin login at startup. Default if __False__

## Python integration

Check `test.py` file for a simple example of how to interact with the Ollama server.
