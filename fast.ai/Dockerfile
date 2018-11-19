FROM jupyterhub/jupyterhub:0.9.3
LABEL author="Mpho Mphego <mpho112@gmail.com>"

# Install system software.
RUN apt-get update -q && \
    apt-get install -qq -y --no-install-recommends \
        apg \
        build-essential \
        curl \
        graphviz \
        locate \
        make \
        nano \
        software-properties-common \
        unzip \
        wget \
        whois && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf  /var/cache/apt/archives/

# Current PyTorch release for CPU-only
RUN pip install torch_nightly -f https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html && \
# Current tensorflow release for CPU-only
 pip install tensorflow==1.11 && \
# Current fastai release for CPU-only
pip install fastai && \
# Other dependencies
pip install -U \
        bcolz \
        opencv-python \
        seaborn \
        numpy \
        graphviz \
        h5py \
        ipython['all'] \
        ipywidgets \
        jupyter \
        Pillow \
        scikit-learn \
        scipy \
        sklearn \
        tables \
        xgboost \
        xlrd && \
# Jupyter dependencies
pip install \
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
