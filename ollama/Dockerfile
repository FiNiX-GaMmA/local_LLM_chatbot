FROM ollama/ollama

RUN apt-get update && apt-get install -y curl

RUN python3 -m pip install --upgrade
RUN pip install ollama==0.1.6

RUN ollama run llama2
