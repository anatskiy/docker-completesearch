CompleteSearch Docker Image

## Installed tools

* [CompleteSearch](http://ad-wiki.informatik.uni-freiburg.de/completesearch)

## Requirements

* [Docker](https://docs.docker.com/installation/) for Linux / macOS / Windows
* [Kitematic](https://kitematic.com) for macOS / Windows (Optional)

## Usage

To build:
```
docker build -t completesearch --build-arg USERNAME=username --build-arg PASSWORD="password" .
```
Where USERNAME and PASSWORD are your credentials for CompleteSearch svn repository.

To run:
```
docker run -it -p 8888:8888 completesearch /bin/bash  
```
