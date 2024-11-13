FROM python:3.9 
MAINTAINER Jibran Siraj Nakhwa <nakhwa.jibrann@gmail.com>

WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -qq -y build-essential libpq-dev postgresql-client --fix-missing --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*


RUN pip install --no-cache -r requirements.txt

COPY . /app/

CMD [ "python","app.py" ]

