# This file is a template, and might need editing before it works on your project.
# This Dockerfile installs a compiled binary into a bare system.
# You must either commit your compiled binary into source control (not recommended)
# or build the binary first as part of a CI/CD pipeline.

FROM ubuntu:18.04

LABEL maintainer="Sriranga Kashyap 11-2019 < sriranga.kashyap@gmail.com >"

USER root

RUN echo "Installing updates to Ubuntu Trust 18.04 LTS" && \
    apt-get update -y && \
    apt-get install -y apt-utils && \
    apt-get upgrade -y && \
    apt-get install -y curl build-essential \
    ccache wget \
    zlib1g-dev \
    python3-pip \
    python-pip \
    liblapack-dev \
    libblas-dev \
    apt-transport-https \
    git \
    tar && \
    apt-get update -y && \
    apt-get upgrade -y

WORKDIR /tmp

############ Installing and setting up pyprf
RUN echo "Installing pyprf"
RUN pip install numpy==1.16.1 && \
	git clone https://gitlab.com/skash/pyprf.git && \
	pip install /tmp/pyprf

RUN echo "pyprf Ready for Use."
