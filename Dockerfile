FROM ubuntu:14.04

MAINTAINER Evgeny Anatskiy <evgeny.anatskiy@gmail.com>

ARG USERNAME
ARG PASSWORD

RUN \
  apt-get update && apt-get -y upgrade && \
  apt-get install -y language-pack-en make nano subversion && \
  apt-get install -y g++ zlib1g-dev libexpat1-dev libboost-all-dev libsparsehash-dev libgtest-dev libstxxl-dev

ENV LANG en_US.UTF-8

RUN \
  mkdir completesearch && cd completesearch && \
  svn checkout https://ad-svn.informatik.uni-freiburg.de/completesearch/codebase --username $USERNAME --password $PASSWORD --non-interactive --trust-server-cert && \
  cd codebase && \
  sed -i '/#CS_CODE_DIR/c\CS_CODE_DIR = /completesearch/codebase' Makefile && \
  make build-all

WORKDIR /completesearch/codebase
