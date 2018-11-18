#!/usr/bin/env bash
set -e
cd /data
exec latexmk -cd -f -jobname=output -outdir=./compile -auxdir=./compile -interaction=batchmode -pdf "$@"