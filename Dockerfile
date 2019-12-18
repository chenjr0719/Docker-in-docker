FROM ubuntu:18.04

LABEL maintainer="Jacob <chenjr0719@gmail.com>"

# Add Docker repository
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker-ce-cli
