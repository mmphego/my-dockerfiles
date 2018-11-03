FROM jupyterhub/jupyterhub:0.9.3
LABEL Mpho Mphego <mpho112@gmail.com>

# Install system software.
RUN apt-get update && \
    apt-get install -y \
        apg \
        build-essential \
        curl \
        git \
        graphviz \
        htop \
        locate \
        make \
        nano \
        openssh-client \
        software-properties-common \
        unzip \
        wget \
        whois && \
    apt-get clean -y

RUN pip install torch_nightly -f https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html

RUN pip install \
        fastai \
        graphviz \
        ipywidgets \
        jupyter \
        ipython['all'] \
        scikit-learn \
        scipy \
        tables \
        xgboost \
        xlrd

RUN useradd jupyter -m -p `mkpasswd jupyter` -s /bin/bash

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

EXPOSE 8000
USER jupyter
WORKDIR /home/jupyter
RUN git clone https://github.com/fastai/fastai.git
