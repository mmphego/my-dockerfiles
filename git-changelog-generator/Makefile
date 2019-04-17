.PHONY: help build clean

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build		to build a git-chglog docker container."
	@echo "  clean		to clean and delete git-chglog container and images."
	@echo "  push		to push git-chglog to docker registry."

build:
	@docker build -t mmphego/git-chglog .

clean:
	@docker rm -v -f mmphego/git-chglog
	@docker rmi -f mmphego/git-chglog

push:
	@docker push mmphego/git-chglog