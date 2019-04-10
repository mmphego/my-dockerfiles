.PHONY: help build git run stop start clean superclean log shell

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build				to build a jupyterhub docker container"
	@echo "  git				to clone latest fast.ai repo"
	@echo "  run 				to run pre-built jupyterhub container"
	@echo "  start  			to start an existing jupyterhub container"
	@echo "  stop   			to stop an existing jupyterhub container"
	@echo ""
	@echo "  log      			to see the logs of a running container"
	@echo "  shell      			to execute a shell on jupyterhub container"
	@echo ""
	@echo "  clean      			to stop and delete jupyterhub container"
	@echo "  superclean     		to clean and delete jupyterhub images"

git:
	# Clone latest fastai repo and install fastai in development mode
	@git clone --progress https://github.com/fastai/fastai.git

build:
	@docker build -t mmphego/jupyterhub .

run:
	@docker run --restart=on-failure:10 -d --name=jupyterhub -p 8000:8000 mmphego/jupyterhub

start:
	@docker start mmphego/jupyterhub || true

stop:
	@docker stop mmphego/jupyterhub || true

clean: stop
	@docker rm -v -f mmphego/jupyterhub || true

superclean: clean
	@docker rmi -f mmphego/jupyterhub || true

log:
	@docker logs -f mmphego/jupyterhub

shell:
	@docker exec -it mmphego/jupyterhub bash