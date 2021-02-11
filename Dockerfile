FROM ubuntu 

LABEL maintainer="Carlo Barraco <carlobarraco@gmail.com>"
LABEL author="Carlo Barraco <carlobarraco@gmail.com>"
LABEL description="An icecream daemon image based on the latest Ubuntu"

ENV LANG=en_US.utf8
ENV DEBIAN_FRONTEND=noninteractive
ENV JOBS=${JOBS:--1}

RUN apt-get update && apt-get install -y icecc build-essential

EXPOSE 10245/tcp
EXPOSE 8766/tcp

RUN apt-get install -y libncurses-dev libssl-dev libelf-dev libudev-dev \
	    libpci-dev libiberty-dev && \
    apt-get autoclean && \
    rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*

ENTRYPOINT iceccd -vvv -m ${JOBS}

HEALTHCHECK --interval=5m --timeout=3s \
    CMD curl -f http://0.0.0.0:10245/ || exit 1
