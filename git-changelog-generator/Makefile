.PHONY: help build clean push

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build		to build a github-changelog docker container"
	@echo "  clean		to clean and delete github-changelog container and images"
	@echo "  superclean		to clean and delete github-changelog container and images"

build:
	@docker build -t mmphego/github-changelog .

clean:
	@docker rm -v -f mmphego/github-changelog || true

superclean: clean
	@docker rmi -f mmphego/github-changelog || true

push:
	@docker push mmphego/github-changelog