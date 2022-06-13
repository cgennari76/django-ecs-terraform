FROM ubuntu:20.04

EXPOSE 8000
# install python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# install postgres drivers
ARG DEBIAN_FRONTEND=noninteractive
RUN apt install -y postgresql postgresql-contrib \
    && apt install -y libpq-dev python3-dev \
    && apt install python3-psycopg2 \
    && apt install -y python3-distutils uwsgi uwsgi-src uuid-dev libcap-dev libpcre3-dev uwsgi uwsgi-plugin-python3 \
    && pip3 install psycopg2

# install and start postgresql
RUN apt install -y postgresql postgresql-contrib

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set firewall rule

# install dependencies
RUN pip3 install --upgrade pip
COPY ./requirements.txt .
RUN pip3 install -r requirements.txt
RUN pip3 install uwsgi

# copy project
COPY . .
CMD ["uwsgi", "--ini", "uwsgi.ini"]
