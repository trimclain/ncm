SHELL := /bin/bash

all:
	@echo 'Type `make help` to see the help menu.'

help: ## Print this help menu
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

image: ## Build a docker image for testing
	@if ! command -v docker > /dev/null; then \
		echo "Docker not found, install it first"; \
	elif [[ $$(docker images | grep ncmtest) ]]; then \
		echo 'Image "ncmtest" already exists'; \
	else \
		echo 'Building the "ncmtest" image'; \
		docker build -t ncmtest . && \
		echo "Built successfully";\
	fi

delimage: ## Delete the docker image for testing
	@if [[ $$(docker images | grep ncmtest) ]]; then \
		echo 'Deleting "ncmtest" image'; \
		docker image rm ncmtest:latest -f; \
	else \
		echo 'Image "ncmtest" not found. Build it with `make image`.'; \
	fi

reimage: delimage image ## Rebuild existing docker image

test: ## Create and run the ncmtest container interactively
	@if [[ $$(docker images | grep ncmtest) ]]; then \
		if [[ $$(docker ps -a | grep ncmtester) ]]; then \
			docker rm ncmtester; \
		fi;\
		docker run -it ncmtest --name ncmtester; \
	else \
		echo 'Image "ncmtest" not found. Create it with `make image`.'; \
	fi

retest: ## Attach to existing ncmtester container interactively
	@if [[ $$(docker ps -a | grep ncmtester) ]]; then \
		docker start -ai ncmtester; \
	else \
		echo 'Container "ncmtester" not found. Create it with `make test`.'; \
	fi

cp: ## Copy ncm to existing running container
	@if [[ $$(docker ps | grep ncmtester) ]]; then \
		docker cp ./ncm ncmtester:/home/tester/.local/bin/ncm; \
	else \
		echo 'Container "ncmtester" is not running. Start it with `make test` or `make retest`.'; \
	fi


.PHONY: all help image delimage reimage test retest cp
