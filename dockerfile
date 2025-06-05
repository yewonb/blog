FROM python:3.10.12

ENV PYTHONUNBUFFERED 1

RUN apt-get -y update
RUN apt-get -y install vim

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install -r requirements.

RUN which gunicorn && ls -l $(which gunicorn)

COPY . /app/

COPY .env .
