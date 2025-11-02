import ollama
import json

try:
    ollama.list() # A simple command will raise an exception if the server is down
    print("Ollama server is running.")
except Exception as e:
    print(f"Ollama server is not reachable. Error: {e}")

# Get models
models = ollama.list()

print("--- Installed Models ---")
if not models['models']:
    print("No models installed.")
else:
    for model in models['models']:
        print(f"""
Name: {model['model']},
  - Size: {round(model['size'] / (1024**3), 2)} GB, 
  - Family: {model['details'].family}, 
  - Parameter size: {model['details'].parameter_size}
  - Quantization Level: {model['details'].quantization_level}""")
print("-"*20)

# Set the host URL when creating the client instance
client = ollama.Client(host='http://localhost:11434')

# Now, any command executed through this client instance will use the specified host
response = client.chat(model='mistral:7b', messages=[
    {
        'role': 'user',
        'content': 'Why is the sky blue?',
    },
])

print(response['message']['content'])