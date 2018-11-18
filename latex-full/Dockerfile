FROM ubuntu:xenial
LABEL Mpho Mphego <mpho112@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -qy \
    texlive-full \
    chktex \
    latexmk \
    texlive-latex-extra \
    python-pygments \
    gnuplot \
    make \
    git \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

VOLUME [ "/data" ]
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
