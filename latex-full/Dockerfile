# Usage:
# docker run --rm -i -v "$PWD":/data --user="$(id -u):$(id -g)" latex-full:ubuntu main.tex

FROM ubuntu:xenial
LABEL maintainer="Mpho Mphego <mpho112@gmail.com>"
ENV DEBIAN_FRONTEND noninteractive
# hadolint ignore=DL3008
RUN apt-get update -q && \
    apt-get install -qy --no-install-recommends \
                        texlive-full \
                        chktex \
                        latexmk \
                        texlive-latex-extra \
                        python-pygments \
                        gnuplot \
                        make \
                        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf  /var/cache/apt/archives/

VOLUME [ "/data" ]
WORKDIR /data
CMD ["latexmk", "$@"]
