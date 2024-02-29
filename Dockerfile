# app/Dockerfile

FROM python:3.9-slim
LABEL authors="AryaroopMajumder"

RUN python3 -m pip install --upgrade \
    setuptools \
    wheel

RUN apt-get update && apt-get install -y curl

COPY chatbot/requirements.txt /var/www/requirements.txt
RUN pip install -r /var/www/requirements.txt


# the .. is going to the move to the parent directory
COPY . /var/www
WORKDIR /var/www

EXPOSE 8007
ENTRYPOINT ["streamlit", "run", "./app.py", "--server.port=8007", "--server.address=0.0.0.0"]