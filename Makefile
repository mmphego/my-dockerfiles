SHELL := /bin/bash -eo pipefail
# Defined images here
.PHONY: $(IMAGES)
IMAGES := markdownlint \
		jekyll \
		medium2md \
		jupyter \
		travis-client \
		git-changelog-generator \
		latex-full

DOCKER_USERNAME := mmphego
REGISTRY := https://index.docker.io/v1
DATE_ID := $(shell date +"%y.%m.%d")
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys
print("Please use `make <target>` where <target> is one of\n")
for line in sys.stdin:
	match = re.match(r'(^([a-zA-Z-]+).*?)## (.*)$$', line)
	if match:
		target, _, help = match.groups()
		if not any([
			target.startswith('--'),
			'%' in target
		]):
			target = target.replace(':','')
			print(f'{target:40} {help}')
		if '%' in target:
			target = target.replace('_%:', '_{image_name}').split(' ')[0]
			print(f'{target:40} {help}')
endef
export PRINT_HELP_PYSCRIPT

.PHONY: help
help:
	@python3 -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

##########################################################################################
#################################### [Multiple Targets] ##################################
##########################################################################################
# USAGE:
# - To build and publish all images: `make push_all`
# - To only build: `make build_all`
build_all: $(foreach img, $(IMAGES), build_$(img))
	touch .$@

push_all:  ## Push all images to docker_username.
	for img in $(IMAGES); do \
		if ! make push_$(subst .,,$$img); then \
			echo "Failed to build ${img}."; \
			exit 1; \
		fi; \
	done

##########################################################################################
#################################### [Generic Targets] ###################################
##########################################################################################
pre_build_%: IMAGE = $(subst pre_build_,,$@)
pre_build_%:  ## Run Dockerfile linter (https://github.com/hadolint/hadolint)
	docker run --rm -i hadolint/hadolint < $(IMAGE)/Dockerfile

build_cached_%: IMAGE = $(subst build_cached_,,$@)
build_cached_%: pre_build_%  ## Build the docker image [Using cache when building].
	docker build -t "$(IMAGE):latest" "${IMAGE}"

build_%: IMAGE = $(subst build_,,$@)
build_%: pre_build_%  ## Build the docker image [Not using cache when building].
	docker build --no-cache -t "$(IMAGE):latest" "${IMAGE}"
	touch .$@

tag_%: IMAGE = $(subst tag_,,$@)
tag_%: pre_build_%  ## Tag a container before pushing to docker_username.
	if [ ! -f ".build_${IMAGE}" ]; then \
		echo "Rebuilding the image: ${IMAGE}"; \
		make build_$(IMAGE); \
	fi;
	docker tag "$(IMAGE):latest" "$(IMAGE):latest"

push_%: IMAGE = $(subst push_,,$@)
push_%: tag_%  ## Push tagged container to docker_username.
	docker push $(DOCKER_USERNAME)/$(IMAGE):latest
	rm -rf ".build_$(IMAGE)"

start_%: IMAGE = $(subst start_,,$@)
start_%:  ## Start a container.
	docker run -it -d --name $(IMAGE) $(IMAGE):latest

stop_%: IMAGE = $(subst stop_,,$@)
stop_%:  ## Stop a running container.
	docker stop $(IMAGE) || true

shell_%: IMAGE = $(subst shell_,,$@)
shell_%: stop_% build_cached_% cleanup_% start_% ## Execute bash inside the container [Debugging]
	docker exec -it "$(IMAGE)" /bin/bash

cleanup_%: IMAGE = $(subst cleanup_,,$@)
cleanup_%:  ## Cleanup and remove all stopped containers.
	docker stop "$(shell docker ps -q)" || true
	docker rm "$(IMAGE)" || true
	docker rm "$(shell docker ps -a -q -f status=exited)" || true

rmi_%: IMAGE = $(subst rmi_,,$@)
rmi_%: cleanup_%  ## Cleanup and remove all remnants containers and images.
	docker rm -v $(docker ps -a -q -f status=exited)
	docker rmi $(docker images -f "dangling=true" -q)

prune_%: IMAGE = $(subst prune_,,$@)
prune_%:  ## Remove images older than one week
	docker rmi --force $(shell docker images --format '{{.Repository}}:{{.Tag}}:{{.CreatedSince}}' | grep $(IMAGE) | grep -v "<none>" | grep 'weeks ago\|months ago\|years ago' | cut -f 1-2 -d ':') || true

.PHONY: prune_system
prune_system:
	docker system prune -af