CompleteSearch Docker image: download CompleteSearch source code with all dependencies and build it.

## Installed tools

* [CompleteSearch](http://ad-wiki.informatik.uni-freiburg.de/completesearch)
* [CompleteSearch web app](https://github.com/anatskiy/CompleteSearch)

## Requirements

* [Docker](https://docs.docker.com/engine/installation/) for Linux/macOS/Windows
* [Docker Compose](https://docs.docker.com/compose/install/)

## Installation

### Step 0

Install Docker and Docker Compose.

### Step 1

Clone this repository:
```
git clone https://github.com/anatskiy/docker-completesearch.git
cd docker-completesearch
```

Build the images:
```
SVN_USERNAME="username" SVN_USERNAME="password" docker-compose build
```
Where `SVN_USERNAME` and `SVN_PASSWORD` are your credentials for the CompleteSearch svn repository. [More information](http://ad-wiki.informatik.uni-freiburg.de/completesearch).

**Note:** You need to escape username and password with double quotes "".

### Step 2

Start the services:
```
docker-compose up -d
```

---

## Usage

Open CompleteSearch at `http://localhost:8000/`
