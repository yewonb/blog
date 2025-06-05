FROM python:3.10.12

ENV PYTHONUNBUFFERED 1

RUN apt-get -y update && apt-get -y install vim

WORKDIR /app

# requirements.txt 복사 및 pip 설치
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# gunicorn 설치 확인
RUN which gunicorn && ls -l $(which gunicorn)

# 전체 프로젝트 복사
COPY . /app/
COPY .env /app/
