SHELL := /bin/bash

all:
	@echo 'Type `make help` to see the help menu.'

help: ## Prints this help menu
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

container: ## Build a docker container for testing
	@if ! command -v docker > /dev/null; then echo "Docker not found, install it first"; \
		elif [[ $$(docker images | grep ncmtest) ]]; then \
		echo 'Container "ncmtest" already exists'; else echo 'Building the "ncmtest" container' \
		&& docker build -t ncmtest . && echo "Built successfully"; fi

delcontainer: ## Delete the docker container for testing
	@if [[ $$(docker images | grep ncmtest) ]]; then echo 'Deleting "ncmtest" container' && \
		docker image rm ncmtest:latest -f; \
		else echo 'Container "ncmtest" not found. Build it with `make container`.'; fi

rebuild: delcontainer container ## Rebuild existing docker container

test: ## Run the ncmtest container interactively
	@if [[ $$(docker images | grep ncmtest) ]]; then docker run -it ncmtest; \
		else echo 'Container "ncmtest" not found. Build it with `make container`.'; fi


.PHONY: all help container delcontainer rebuild test
