#!/usr/bin/env bash
set -e
IMAGE="latex-full:ubuntu"

if [ $# -eq 0 ]; then
    echo "Usage: $0 main.tex"
    exit 1
fi

if test ! -z "$(docker image inspect ${IMAGE})"; then
    exec docker run --rm -i -v "$PWD":/data --user="$(id -u):$(id -g)" "${IMAGE}" "$@"
else
    echo "Latex Docker image missing"
 fi