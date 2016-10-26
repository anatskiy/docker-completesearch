FROM ubuntu:14.04

MAINTAINER Evgeny Anatskiy <evgeny.anatskiy@gmail.com>

RUN \
  apt update && \
  apt -y upgrade && \
  apt install -y language-pack-en make subversion && \
  locale-gen && \
  export LANG=en_US.UTF-8

RUN \
  mkdir -p /home/root


WORKDIR /home/root
