# CompleteSearch Docker image

## Requirements

* [Docker](https://docs.docker.com/engine/installation/) for Linux/macOS/Windows

## Installation

### Step 0

Install Docker.

### Step 1

Clone this repository:
```
git clone https://github.com/anatskiy/docker-completesearch.git
cd docker-completesearch
```

Build the image:
```
docker build \
    -t completesearch \
    --build-arg SVN_USERNAME="username" \
    --build-arg SVN_PASSWORD="password" \
    .
```
Where `SVN_USERNAME` and `SVN_PASSWORD` are your credentials for the CompleteSearch svn repository. [More information](http://ad-wiki.informatik.uni-freiburg.de/completesearch).

**Note:** You need to escape username and password with double quotes "".

### Step 2

Run the container:
```
docker run -d \
    --name completesearch \
    -p 8000:8000 \
    -p 8888:8888 \
    completesearch \
    python3 manage.py runserver -h 0.0.0.0 -p 8000
```

---

## Usage

Open CompleteSearch at `http://localhost:8000/`
