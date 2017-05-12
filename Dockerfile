FROM ubuntu:16.04

MAINTAINER Evgeny Anatskiy <evgeny.anatskiy@gmail.com>

# Install system dependencies
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y language-pack-en make nano curl subversion git python3-pip && \
    apt-get install -y g++ build-essential libffi-dev libssl-dev zlib1g-dev libexpat1-dev libboost-all-dev libsparsehash-dev libgtest-dev libstxxl-dev

# Install npm
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get install -y nodejs

# Build arguments
ARG SVN_USERNAME
ARG SVN_PASSWORD

ENV LANG en_US.UTF-8
ENV TERM xterm

WORKDIR /usr/src/completesearch

# Download CompleteSearch codebase
RUN svn checkout https://ad-svn.informatik.uni-freiburg.de/completesearch/codebase --username $SVN_USERNAME --password $SVN_PASSWORD --non-interactive --trust-server-cert . && \
    mv Makefile Makefile_orig && \
    cp parser/utf8.map server

ADD Makefile ./

# Fix some bugs in the source code (temporary solution)
ADD fixes/* server/

# Build the codebase
RUN make build-all

WORKDIR /usr/src/app

# Download web app
RUN git clone https://github.com/anatskiy/CompleteSearch.git .

# Install backend dependencies
RUN pip3 install -r requirements.txt

# Install frontend dependencies
RUN npm install -g gulp && npm install

# Build the client
RUN gulp webpack:once

RUN mkdir /usr/src/data

EXPOSE 5000 8888

CMD ["python3", "manage.py", "runserver"]
