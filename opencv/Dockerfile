FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"
# hadolint ignore=DL3008
RUN apt-get update -q && \
    apt-get install -qy --no-install-recommends \
    wget \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf  /var/cache/apt/archives/
