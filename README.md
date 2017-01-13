CompleteSearch Docker Image: download CompleteSearch source code with all dependencies and compile (build) it.

## Installed tools

* [CompleteSearch](http://ad-wiki.informatik.uni-freiburg.de/completesearch)

## Requirements

* [Docker](https://docs.docker.com/installation/) for Linux / macOS / Windows
* [Kitematic](https://kitematic.com) for macOS / Windows (Optional)

## Usage

To build:
```
docker build -t completesearch --build-arg SVN_USERNAME="username" --build-arg SVN_PASSWORD="password" .
```
Where *SVN_USERNAME* and *SVN_PASSWORD* are your credentials for CompleteSearch svn repository.

**Note:** You need to escape username and password with quotes "".

---

To run:
```
docker run -it -p 8888:8888 completesearch /bin/bash  
```
