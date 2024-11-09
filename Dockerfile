FROM python:latest 
MAINTAINER Jibran Siraj Nakhwa <nakhwa.jibrann@gmail.com>

RUN apt-get update && apt-get install -qq -y build-essential libpq-dev postgresql-client --fix-missing --no-install-recommends

ENV INSTALL_PATH /mobydock
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . . 

VOLUME ["/mobydock/static"]

CMD gunicorn 0.0.0.0:8000 "mobydock.app.create_app()"
