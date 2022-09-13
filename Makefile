#!/bin/bash
DOCKER_COMPOSE = docker-compose
include .env

# Text formatting codes
RED=\033[31m
GREEN=\033[32m
YELLOW=\033[33m
BLUE=\033[1;34m
RED_BG=\033[1;41m
ITALIC=\033[3m
RESET=\033[0m

define HEX =
$(subst \033,\x1b,$(1))
endef


#Command 'run-test' will help you raise up containers for run testing in basic mode
test-local-machine: 
	@npx wdio wdio.conf.ts

#Command 'build' will help to build your containers for run testing in container mode
install:
	@docker-compose -f docker-compose.yml -f docker-compose.local.yml build

#Command 'local-run' will help to run your tests in containers 
test-local-containers:
	$(info Make: Starting docker in local env)
	docker-compose -f docker-compose.yml -f docker-compose.local.yml up --abort-on-container-exit --exit-code-from e2e

#Command 'local-stop' is shutting down your containers 
test-local-stop:
	$(info Make: Stopping docker in local env)
	docker-compose -f docker-compose.yml -f docker-compose.local.yml down

#Serve this command for running tests in CI environment
test-ci:
	$(info Make: Starting docker in CI env)
	docker-compose -f docker-compose.yml -f docker-compose.ci.yml up --abort-on-container-exit --exit-code-from e2e

.env: .env.example
	@if [ -f .env ]; \
	then \
		echo "\n$(YELLOW)Notice:$(RESET) $(BLUE).env.example$(RESET) has changed"; \
		touch .env; \
	else \
		echo "$(RED)Warning:$(RESET) No $(BLUE).env$(RESET) found - creating from $(BLUE).env.example$(RESET)\n"; \
		echo "Please update your configuration."; \
		echo cp .env.example .env; \
		cp .env.example .env; \
		exit 1; \
	fi	


#Command to create Allure test report	
test-report:
	@if [ true ]; \
	then \
		echo "\n$(YELLOW)ALLURE LINK:$(RESET) $(GREEN)http://localhost:5050/allure-docker-service/projects/default/reports/latest/index.html$(RESET)"; \
		docker-compose -f docker-compose.allure.yml up; \
	fi	