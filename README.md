# Docker-in-docker

Using Docker in docker container. This container can using the Docker daemon on the host to simulate the nested docker container.

## How to use

1. Run this cntainer. Rememver you must mount the docker daemon to this container

    ```bash
    docker run -it --name did -v /var/run/docker.sock:/var/run/docker.sock chenjr0719/did
    ```

2. Use docker command

    ```bash
    docker ps
    docker images
    ```

## How it works

Its quiet simple, just using the docker CLI to access the Docker daemon socket on the host.

1. Run a container with docker daemon

    ```bash
    docker run -it -v /var/run/docker.sock:/var/run/docker.sock ubuntu:18.04 bash
    ```

2. Add Docker repository

    ```bash
    apt-get update
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    ```

3. Install Docker CLI in container

    ```bash
    apt-get update
    apt-get install -y docker-ce-cli
    ```

4. Using Docker in container

    ```bash
    docker ps
    docker images
    ```
