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
RUN wget http://registrationcenter-download.intel.com/akdlm/irc_nas/16345/l_openvino_toolkit_p_2020.1.023.tgz
RUN tar -xvzf l_openvino_toolkit_p_2020.1.023.tgz
ARG INSTALL_DIR=/opt/intel/openvino