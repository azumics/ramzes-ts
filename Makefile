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

sayhello : 
	@echo "Hello, Guys!"
#Command 'run-test' will help you raise up containers for crossbrowser testing in grid
run-test: 
	@npx wdio wdio.conf.ts

#Command 'grid-up' will help you raise up containers for crossbrowser testing in grid
grid-up : 
	@docker-compose -f selenium-4-grid.yml up -d

#Command 'grid-down' will turn-off your GRID containers with removing
grid-down : 
	@docker-compose -f selenium-4-grid.yml down

#Command 'grid-run' will run your automation test in crossbrowser mode
grid-run : 
	@npx wdio wdio.grid.conf.ts

selenoid-start : 
	@./cm_linux_amd64 selenoid start --vnc

selenoid-ui-start : 
	@./cm_linux_amd64 selenoid-ui start


#####EXTERNAL SELENOID
###изменить название мейк команд
local-build:
	$(info Make: Building docker images in local env)
	docker-compose -f docker-compose.yml -f docker-compose.local.yml build

local-up:
	$(info Make: Starting docker in local env)
	docker-compose -f docker-compose.yml -f docker-compose.local.yml up

local-down:
	$(info Make: Stopping docker in local env)
	docker-compose -f docker-compose.yml -f docker-compose.local.yml down

ci-up:
	@docker-compose -f docker-compose.yml -f docker-compose.ci.yml up --abort-on-container-exit --exit-code-from e2e
