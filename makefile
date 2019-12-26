#
# makefile
# Devcrate
# Project makefile
#
# vars
VERSION:=0.2.0

## docker config
DOCKER:=docker
TAG_PREFIX:=mrzzy
# names of the docker images
IMG_NAMES:=$(notdir $(wildcard containers/*))
IMAGES:=$(foreach img,$(IMG_NAMES),$(TAG_PREFIX)/$(img))
BASE_IMAGE:=$(TAG_PREFIX)/devcrate
# names of the images that depends on base image
DEP_BASE_NAMES:=$(filter-out devcrate, $(IMG_NAMES)))
DEP_BASE_IMAGES:=$(foreach img,$(DEP_BASE_NAMES),$(TAG_PREFIX)/$(img))
PUSH_TARGETS:=$(foreach img,$(IMAGES),push/$(img))

# proxy config
HTTP_PROXY=http://127.0.0.1:1081

## devcrate config
# default credentials
USER:=$(USER)
PASSWORD:=passwds

# phony rules
.PHONY: all push clean clean-version run
.DEFAULT: all 

all: $(DEP_BASE_IMAGES)

# image rules
# image deps
$(DEP_BASE_IMAGES): $(BASE_IMAGE)

# docker build rule
$(TAG_PREFIX)/%: containers/%/Dockerfile $(CMS_SRC_DIR)
	# latest tag
	$(DOCKER) build \
		--network=host \
		$(if $(HTTP_PROXY),--build-arg http_proxy=$(HTTP_PROXY),) \
		$(if $(USER),--build-arg USERNAME=$(USER),) \
		$(if $(PASSWORD),--build-arg PASSWORD=$(PASSWORD),) \
		-f $< -t $@ .
	# versioned tag
	$(DOCKER) tag $@ $@:$(VERSION) 

# docker push rule
push: $(PUSH_TARGETS)

push/%: %
	docker push $<

# cleans docker images from image cache 
# clean all docker images
clean: clean-version
	$(foreach img,$(IMAGES),docker rmi -f $(img);)

# clean versioned docker images
clean-version:
	$(foreach img,$(IMAGES),docker rmi -f $(img):$(VERSION);)
	
# runs the images
run:
	$(DOCKER) run -it \
		--network=host \
		$(if $(HTTP_PROXY),--env http_proxy=$(HTTP_PROXY),) \
		$(BASE_IMAGE)
		#-v $(HOME)/trx:/home/trx 
