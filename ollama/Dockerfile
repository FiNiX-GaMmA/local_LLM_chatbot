FROM ollama/ollama

RUN apt-get update && apt-get install -y curl python3-pip
RUN pip install ollama==0.1.6

RUN ollama run llama2
