# CompleteSearch Docker image

## Requirements

* [Docker](https://docs.docker.com/engine/installation/) for Linux/macOS/Windows

## Installation

### Step 0

Install Docker.

### Step 1

Clone this repository:

    git clone https://github.com/anatskiy/docker-completesearch.git
    cd docker-completesearch

Checkout the Completesearch repository into a subfolder called `completesearch`

    svn checkout https://ad-svn.informatik.uni-freiburg.de/completesearch/codebase --username <username> --revision 1715 completesearch

Where `<username>` is the one for the CompleteSearch svn repository. [More
information](http://ad-wiki.informatik.uni-freiburg.de/completesearch).

Build the image:

    docker build -t completesearch .

### Step 2

Run the container:

    docker run -d \
        --name completesearch \
        -p 8000:8000 \
        -p 8888:8888 \
        completesearch \
        python3 manage.py runserver -h 0.0.0.0 -p 8000

---

## Usage

Open CompleteSearch at `http://localhost:8000/`
