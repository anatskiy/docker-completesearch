CompleteSearch Docker image: download CompleteSearch source code with all dependencies and build it.

## Installed tools

* [CompleteSearch](http://ad-wiki.informatik.uni-freiburg.de/completesearch)
* [CompleteSearch web app](https://github.com/anatskiy/CompleteSearch)

## Requirements

* [Docker](https://docs.docker.com/engine/installation/) for Linux/macOS/Windows
* [Docker Machine](https://docs.docker.com/machine/install-machine/) for Linux/macOS/Windows

## Installation

### Step 0

Install [Docker](https://docs.docker.com/engine/installation/) and [Docker Machine](https://docs.docker.com/machine/install-machine/).

Configure Docker Machine:
```
docker-machine create -d virtualbox default
docker-machine env default
eval "$(docker-machine env default)"
```
[More information](https://docs.docker.com/machine/get-started/).

### Step 1

Clone this repository:
```
git clone https://github.com/anatskiy/docker-completesearch.git
cd docker-completesearch
```

Build the image:
```
docker build -t completesearch --build-arg SVN_USERNAME="username" --build-arg SVN_PASSWORD="password” .
```
Where *SVN_USERNAME* and *SVN_PASSWORD* are your credentials for CompleteSearch svn repository. [More information](http://ad-wiki.informatik.uni-freiburg.de/completesearch).

**Note:** You need to escape username and password with quotes "".

### Step 2

Run the container:
```
docker run -d -p 5000:5000 --name completesearch completesearch
```

---

## Usage

Get Docker Machine ip:
```
docker-machine ip
```

Run CompleteSearch `http://<docker-machine-ip>:5000/`

To enter the running container:
```
docker exec -it completesearch /bin/bash
docker restart completesearch
```
