# app/Dockerfile

FROM python:3.9-slim
LABEL authors="AryaroopMajumder"

RUN python3 -m pip install --upgrade \
    setuptools \
    wheel

RUN apt-get update && apt-get install -y curl

COPY chatbot/requirements.txt /var/www/requirements.txt
RUN pip install -r /var/www/requirements.txt

RUN curl -fsSL https://ollama.com/install.sh | sh
#RUN ollama serve
RUN ollama pull llama2


# the .. is going to the move to the parent directory
COPY .. /var/www
WORKDIR /var/www

#RUN chmod +x ./deploy/scripts/setup.sh
#RUN ./deploy/scripts/setup.sh



EXPOSE 8007

ENTRYPOINT ["streamlit", "run", "chatbot/pdf_app.py", "--server.port=8007", "--server.address=0.0.0.0"]