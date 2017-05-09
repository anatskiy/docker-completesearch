FROM ubuntu:16.04

MAINTAINER Evgeny Anatskiy <evgeny.anatskiy@gmail.com>

# Install system dependencies
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y language-pack-en make nano curl wget unzip subversion git python3-pip libffi-dev libssl-dev && \
    apt-get install -y g++ zlib1g-dev libexpat1-dev libboost-all-dev libsparsehash-dev libgtest-dev libstxxl-dev

# Build arguments
ARG SVN_USERNAME
ARG SVN_PASSWORD

ENV LANG en_US.UTF-8
ENV TERM xterm

WORKDIR /usr/src/completesearch

# Download CompleteSearch
RUN svn checkout https://ad-svn.informatik.uni-freiburg.de/completesearch/codebase --username $SVN_USERNAME --password $SVN_PASSWORD --non-interactive --trust-server-cert . && \
    mv Makefile Makefile_orig && \
    cp parser/utf8.map server

ADD Makefile ./

# Fix some bugs in the source code (temporary solution)
ADD fixes/* server/

# Build CompleteSearch
RUN make build-all

# Download web app
RUN cd /usr/src && \
	wget `curl -s https://api.github.com/repos/anatskiy/CompleteSearch/releases/latest | grep browser_download_url | cut -d '"' -f 4` && \
	unzip app.zip && \
	rm app.zip

WORKDIR /usr/src/app

# Install backend dependencies
RUN pip3 install -r requirements.txt

# Create shared folder
RUN mkdir /usr/src/data

EXPOSE 5000 8888

CMD ["python3", "manage.py", "runserver"]
