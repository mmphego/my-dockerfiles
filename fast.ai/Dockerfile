# Usage
# docker run --restart=on-failure:10 -d --name=jupyterhub -p 8000:8000 jupyterhub
# hadolint ignore=DL3007
FROM jupyterhub/jupyterhub:latest
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"

# Install system software.
# hadolint ignore=DL3008
RUN apt-get update -q && \
    apt-get install -qq -y --no-install-recommends \
        apg \
        build-essential \
        curl \
        graphviz \
        libstring-mkpasswd-perl \
        locate \
        make \
        python3.6-dev \
        software-properties-common \
        vim \
        wget \
        whois && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf  /var/cache/apt/archives/

# Current tensorflow release for CPU-only
# hadolint ignore=DL3013
RUN pip install tensorflow

# Current fast.ai release by default it installs latest PyTorch
# hadolint ignore=DL3013
RUN pip install fastai

#####################################################################
### Comment/Uncomment depending on your choice between CPU or GPU ###
#####################################################################

# Current PyTorch release for CPU-only
# hadolint ignore=DL3013
# RUN pip install torch_nightly -f https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html && \

# Current PyTorch release for CUDA
# hadolint ignore=DL3013
# RUN pip torch torchvision

# Other dependencies
RUN pip install -U \
        bcolz \
        graphviz \
        h5py \
        ipython['all'] \
        ipywidgets \
        jupyter \
        numpy \
        pandas \
        Pillow \
        scikit-learn \
        scipy \
        seaborn \
        sklearn \
        tables \
        xgboost \
        xlrd

# Jupyter dependencies
RUN pip install \
        jupyter_contrib_nbextensions==0.5.0 \
        jupyter_nbextensions_configurator==0.4.0 && \
        jupyter contrib nbextension install --system --symlink && \
        jupyter nbextensions_configurator enable --system && \
        jupyter nbextension enable varInspector/main --system && \
        jupyter nbextension enable toc2/main --system && \
        jupyter nbextension enable spellchecker/main --system && \
        jupyter nbextension enable rubberband/main --system && \
        jupyter nbextension enable highlighter/highlighter --system && \
        jupyter nbextension enable hide_header/main --system && \
        jupyter nbextension enable freeze/main --system && \
        jupyter nbextension enable exercise2/main --system && \
        jupyter nbextension enable exercise/main --system && \
        jupyter nbextension enable collapsible_headings/main --system && \
        jupyter nbextension enable codefolding/main --system && \
        jupyter nbextension enable codefolding/edit --system && \
        jupyter nbextension enable cell_filter/cell_filter --system

# Setup user
RUN useradd jupyter -m -p "$(mkpasswd jupyter)" -s /bin/bash
EXPOSE 8000
WORKDIR /home/jupyter
USER jupyter
