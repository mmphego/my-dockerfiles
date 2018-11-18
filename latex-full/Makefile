.PHONY: help build latex clean

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build				to build a latex docker container"
	@echo "  superclean     	to clean and delete latex container and images"

build:
	@docker build -t latex-full:ubuntu .

latex:
	@docker run --rm -i -v "$PWD":/data --user="$(id -u):$(id -g)" latex-full:ubuntu "$(FILE)"
clean:
	@docker rm -v -f latex || true
	@docker rmi -f latex || true
