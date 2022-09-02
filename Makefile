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
test: 
	@npx wdio wdio.conf.ts

#Command 'build' will help to build your containers for run testing in container mode
build:
	$(info Make: Building docker images in local env)
	docker-compose -f docker-compose.yml -f docker-compose.local.yml build

#Command 'local-up' will help to run your tests in containers 
local-up:
	$(info Make: Starting docker in local env)
	docker-compose -f docker-compose.yml -f docker-compose.local.yml up --abort-on-container-exit --exit-code-from e2e

#Command 'local-down' is shutting down your containers 
local-down:
	$(info Make: Stopping docker in local env)
	docker-compose -f docker-compose.yml -f docker-compose.local.yml down

#Serve this command for running tests in CI environment
ci-up:
	$(info Make: Starting docker in CI env)
	docker-compose -f docker-compose.yml -f docker-compose.ci.yml up --abort-on-container-exit --exit-code-from e2e
