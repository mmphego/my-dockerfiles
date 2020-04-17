FROM ubuntu:bionic
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"

# Arguments
ARG OPENVINO_VERSION=2020.2.120

# Environments
ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
ENV NODE_VERSION=node_12.x
ENV PIP_DEFAULT_TIMEOUT=100

# OpenVINO Directories
ENV OPENVINO_DIR=/openvino
ENV INSTALL_DIR=/opt/intel

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash-completion \
    build-essential \
    cmake \
    curl \
    g++ \
    gcc \
    git \
    gnupg \
    make \
    python3-dev \
    software-properties-common \
    sudo \
    vim \
    wget \
    && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archives/

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN echo "deb https://deb.nodesource.com/${NODE_VERSION} $(lsb_release -s -c) main" | tee /etc/apt/sources.list.d/nodesource.list

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl https://bootstrap.pypa.io/get-pip.py | python3

# hadolint ignore=DL3008
RUN apt-get update && apt-get -y install --no-install-recommends \
    nodejs \
    ffmpeg \
    libzmq3-dev \
    libkrb5-dev \
    && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archives/

# Other dependencies
RUN python3 -m pip install \
    numpy \
    paho-mqtt \
    ipython['all']

WORKDIR ${OPENVINO_DIR}

COPY openvino_downloader.sh .
RUN ./openvino_downloader.sh ${OPENVINO_VERSION}

# hadolint ignore=DL3010
COPY l_openvino_toolkit_p_*.tgz .
RUN tar zxvf l_openvino_toolkit_p_*.tgz --strip-components=1 \
    && rm -rf l_openvino_toolkit_p_*.tgz

# installing OpenVINO dependencies
RUN ./install_openvino_dependencies.sh
# installing OpenVINO itself
RUN sed -i 's/decline/accept/g' silent.cfg && \
    ./install.sh --silent silent.cfg

# Install Model Optimizer prerequisites
RUN ${INSTALL_DIR}${OPENVINO_DIR}/deployment_tools/model_optimizer/install_prerequisites/install_prerequisites.sh

RUN apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf \
        ${OPENVINO_DIR} \
        /var/lib/apt/lists/* \
        /var/cache/apt/archives

RUN echo "source ${INSTALL_DIR}${OPENVINO_DIR}/bin/setupvars.sh" >> /root/.bashrc
WORKDIR /app
CMD ["/bin/bash"]