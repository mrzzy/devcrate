#
# makefile
# Devcrate
# Project makefile
#

.PHONY: all devcrate
.DEFAULT: all

## Targets
all: devcrate

# devcrate - builds the devcrate docker container
devcrate: dcrate
	docker build $< -t "$@"
