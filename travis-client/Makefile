ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
.PHONY: build clean help install superclean

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  install			to install travis client in `/usr/local/bin` for easier access"
	@echo "  build				to build a travis client docker container"
	@echo "  clean      		to delete travis client container"
	@echo "  superclean     	to clean and delete travis client images"

install:
	@/bin/ln -nsf "${ROOT_DIR}/travis" /usr/local/bin/travis

build:
	@docker build -t mmphego/travis-ci-cli .

clean:
	@docker rm -v -f mmphego/travis-ci-cli || true

superclean: clean
	@docker rmi -f mmphego/travis-ci-cli || true
	@rm -rf /usr/local/bin/travis || true

push:
	@docker push mmphego/travis-ci-cli