FROM ubuntu:14.04

MAINTAINER Evgeny Anatskiy <evgeny.anatskiy@gmail.com>

RUN \
  apt-get update && apt-get -y upgrade && \
  apt-get install -y language-pack-en make subversion && \
  apt-get install -y g++ zlib1g-dev libexpat1-dev libboost-all-dev libsparsehash-dev libgtest-dev libstxxl-dev

ENV LANG en_US.UTF-8

ENV SVN_USERNAME "ea85"
ENV SVN_PASSWORD ",v8W]}s)iJ2bEE87"
ARG SVN_USERNAME=${SVN_USERNAME}
ARG SVN_PASSWORD=${SVN_PASSWORD}

RUN \
  mkdir completesearch && cd completesearch && \
  svn checkout https://ad-svn.informatik.uni-freiburg.de/completesearch/codebase --username $SVN_USERNAME --password $SVN_PASSWORD --non-interactive --trust-server-cert

WORKDIR /completesearch/codebase

RUN \
  sed -i '/#CS_CODE_DIR/c\CS_CODE_DIR = /completesearch/codebase' Makefile && \
  cp parser/utf8.map server
#  mkdir input

# Fix some bugs in the source code (temporary solution)
ADD ./fixes/CompletionServer.cpp /completesearch/codebase/server
ADD ./fixes/ExcerptsGenerator.cpp /completesearch/codebase/server

RUN make build-all
