# Usage:
#       docker run --restart=on-failure:10 -d --name=jupyterhub -p 8000:8000 jupyterhub

# hadolint ignore=DL3007
FROM jupyterhub/jupyterhub:latest
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"

# hadolint ignore=DL3008
RUN apt-get update -q && \
    apt-get install -qq -y --no-install-recommends \
    apg \
    bash-completion \
    build-essential \
    curl \
    g++ \
    gcc \
    git \
    graphviz \
    libstring-mkpasswd-perl \
    locate \
    make \
    python3-dev \
    software-properties-common \
    unzip \
    vim \
    wget \
    whois && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf  /var/cache/apt/archives/

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl https://bootstrap.pypa.io/get-pip.py | python3

ARG DL_TOOLS
RUN test -z "$DL_TOOLS" || python3 -m pip install -U \
    # Current tensorflow release for CPU-only
    tensorflow==2.0.0 \
    tensorboard \
    # Current PyTorch release for CUDA
    torch==1.2.0 \
    torchvision==0.5.0 \
    # Stable fast.ai release by default it installs latest PyTorch
    fastai \
    # Latest release of Detectron2: Object detection and segmentation. (Depends on Torch)
    'git+https://github.com/facebookresearch/detectron2.git' \
    'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'

# Other dependencies
RUN python3 -m pip install -U \
    bcolz \
    black \
    cython \
    graphviz \
    h5py \
    ipython['all'] \
    ipywidgets \
    jupyter \
    matplotlib \
    numpy \
    pandas \
    pandas_utility \
    Pillow \
    pyyaml \
    requests \
    scikit-learn \
    scipy \
    seaborn \
    sklearn \
    tables \
    tqdm \
    watermark \
    xgboost \
    xlrd

# Jupyter dependencies
RUN python3 -m pip install -U \
    jupyter_contrib_nbextensions==0.5.1 \
    jupyter_nbextensions_configurator==0.4.1 && \
    jupyter contrib nbextension install --system --symlink && \
    jupyter nbextensions_configurator enable --system && \
    jupyter nbextension enable cell_filter/cell_filter --system && \
    jupyter nbextension enable codefolding/edit --system && \
    jupyter nbextension enable codefolding/main --system && \
    jupyter nbextension enable collapsible_headings/main --system && \
    jupyter nbextension enable exercise/main --system && \
    jupyter nbextension enable exercise2/main --system && \
    jupyter nbextension enable freeze/main --system && \
    jupyter nbextension enable hide_header/main --system && \
    jupyter nbextension enable highlighter/highlighter --system && \
    jupyter nbextension enable rubberband/main --system && \
    jupyter nbextension enable spellchecker/main --system && \
    jupyter nbextension enable toc2/main --system && \
    jupyter nbextension enable varInspector/main --system && \
    jupyter nbextension install https://github.com/drillan/jupyter-black/archive/master.zip && \
    jupyter nbextension enable jupyter-black-master/jupyter-black

# Setup user
RUN useradd jupyter -m -p "$(mkpasswd jupyter)" -s /bin/bash
EXPOSE 8000
WORKDIR /home/jupyter
USER jupyter
