.PHONY: help build clean

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build		to build a markdownlint docker container"
	@echo "  clean		to clean and delete markdownlint container and images"

build:
	@docker build -t mmphego/markdownlint .

clean:
	@docker rm -v -f mmphego/markdownlint || true
	@docker rmi -f mmphego/markdownlint || true
