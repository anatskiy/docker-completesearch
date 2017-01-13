FROM python:3.5

MAINTAINER Evgeny Anatskiy <evgeny.anatskiy@gmail.com>

RUN git clone https://github.com/anatskiy/CompleteSearch.git

RUN \
    mkdir -p /usr/src/app/logs && mkdir /usr/src/data && \
    cp -a CompleteSearch/. /usr/src/app && \
    rm -rf CompleteSearch

WORKDIR /usr/src/app

# VOLUME /usr/src/data

RUN pip install -r requirements.txt
