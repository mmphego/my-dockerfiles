.PHONY: help build latex clean

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build				to build a latex docker container"
	@echo "  superclean     	to clean and delete latex container and images"

build:
	@docker build -t mmphego/latex-full .

mklatex:
	@docker run --rm -i -v "$PWD":/data --user="$(id -u):$(id -g)" mmphego/latex-full "$(FILE)"

clean:
	@docker rm -v -f mmphego/latex-full || true
	@docker rmi -f mmphego/latex-full || true

push:
	@docker push mmphego/latex-full