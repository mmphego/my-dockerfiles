.PHONY: help build run stop start clean superclean log shell

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  build				to build a jupyterhub docker container"
	@echo "  run 				to run pre-built jupyterhub container"
	@echo "  start  			to start an existing jupyterhub container"
	@echo "  stop   			to stop an existing jupyterhub container"
	@echo ""
	@echo "  log      			to see the logs of a running container"
	@echo "  shell      			to execute a shell on jupyterhub container"
	@echo ""
	@echo "  clean      			to stop and delete jupyterhub container"
	@echo "  superclean     		to clean and delete jupyterhub images"


build:
	@docker build -t jupyterhub .

run:
	@docker run --restart=on-failure:10 -d --name=jupyterhub -p 8000:8000 jupyterhub

start:
	@docker start jupyterhub || true

stop:
	@docker stop jupyterhub || true

clean: stop
	@docker rm -v -f jupyterhub || true

superclean: clean
	@docker rmi -f jupyterhub || true

log:
	@docker logs -f jupyterhub

shell:
	@docker exec -it jupyterhub bash