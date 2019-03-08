.PHONY: help build clean

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build		to build a medium2md docker container"
	@echo "  clean		to clean and delete medium2md container and images"

build:
	@docker build -t mmphego/medium2md .

clean:
	@docker rm -v -f mmphego/medium2md
	@docker rmi -f mmphego/medium2md
