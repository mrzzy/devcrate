#
# makefile
# Devcrate
# Project makefile
#

.PHONY: all devcrate push
.DEFAULT: all

## Targets
all: devcrate push

# devcrate - builds the devcrate docker container
devcrate: dcrate
	docker build $< -t "$@"

# push - pushes the devcrate to dockerhub
push:
	docker tag devcrate mrzzy/devcrate
	docker push mrzzy/devcrate
