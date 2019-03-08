.PHONY: help build clean

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build		to build a mediumexporter docker container"
	@echo "  clean		to clean and delete mediumexporter container and images"

build:
	@docker build -t mmphego/mediumexporter .

clean:
	@docker rm -v -f mmphego/mediumexporter
	@docker rmi -f mmphego/mediumexporter
