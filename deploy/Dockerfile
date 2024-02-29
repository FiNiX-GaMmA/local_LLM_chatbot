# app/Dockerfile

FROM python:3.9-slim
LABEL authors="AryaroopMajumder"

RUN python3 -m pip install --upgrade \
    pip \
    setuptools \
    wheel

COPY . /var/www

WORKDIR /var/www

RUN ls -la

#RUN pip3 install -r /var/www/chatbot/requirements.txt
#RUN chmod +x /var/www/deploy/scripts/setup.sh
#
#RUN /var/www/deploy/scripts/setup.sh
#
EXPOSE 8007

ENTRYPOINT ["streamlit", "run", "chatbot/app.py", "--server.port=8007", "--server.address=0.0.0.0"]