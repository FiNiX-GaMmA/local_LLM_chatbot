# app/Dockerfile

FROM python:3.9-slim
LABEL authors="AryaroopMajumder"

RUN python3 -m pip install --upgrade \
    pip \
    setuptools \
    wheel \
    curl \

# the .. is going to the move to the parent directory
COPY .. /var/www

WORKDIR /var/www

RUN pip3 install -r ./chatbot/requirements.txt

#RUN chmod +x ./deploy/scripts/setup.sh
#RUN ./deploy/scripts/setup.sh

RUN curl -fsSL https://ollama.com/install.sh
RUN ollama pull llama2

EXPOSE 8007

ENTRYPOINT ["streamlit", "run", "chatbot/pdf_app.py", "--server.port=8007", "--server.address=0.0.0.0"]