#
# makefile
# Devcrate
# Project makefile
#

# vars
REPOSITORY:=$(if $(REPOSITORY),$(REPOSITORY),docker.io)
VERSION:=$(if $(VERSION),$(VERSION),latest)
COMMIT_PATH:=$(if $(COMMIT_PATH),$(COMMIT_PATH),.)

## docker config
DOCKER:=docker
TAG_USER:=mrzzy
# names of the docker images
IMG_NAMES:=$(notdir $(wildcard containers/*))
IMAGES:=$(foreach img,$(IMG_NAMES),$(REPOSITORY)/$(TAG_USER)/$(img))
BASE_IMAGE:=$(REPOSITORY)/$(TAG_USER)/devcrate
# names of the images that depends on base image
DEP_BASE_NAMES:=$(filter-out devcrate, $(IMG_NAMES))
DEP_BASE_IMAGES:=$(foreach img,$(DEP_BASE_NAMES),$(REPOSITORY)/$(TAG_USER)/$(img))
PUSH_TARGETS:=$(foreach img,$(IMAGES),push/$(img))
SAVE_TARGETS:=$(foreach img,$(IMAGES),save/$(img))
LOAD_TARGETS:=$(foreach img,$(IMAGES),load/$(img))

# proxy config
## devcrate config
USER:=$(USER)
UID:=$(shell id -u)
GID:=$(shell id -g)

GIT_FULLNAME:=Zhu Zhanyan
GIT_EMAIL:=program.nom@gmail.com

# phony rules
.PHONY: all push clean clean-version run
.DEFAULT: all 

all: $(IMAGES)

# image rules
# docker build rule
$(REPOSITORY)/$(TAG_USER)/%: containers/%/Dockerfile $(CMS_SRC_DIR)
	# latest tag
	$(DOCKER) build \
		--network=host \
		$(if $(USER),--build-arg USERNAME=$(USER),) \
		$(if $(GIT_FULLNAME),--build-arg GIT_FULLNAME="$(GIT_FULLNAME)",) \
		$(if $(GIT_EMAIL),--build-arg GIT_EMAIL=$(GIT_EMAIL),) \
		-f $< -t $@ .
	# versioned tag
	$(DOCKER) tag $@ $@:$(VERSION)


# docker push rule
push: $(PUSH_TARGETS)

push/%:
	docker push $(subst push/,,$@)

# docker save & load image
save: $(SAVE_TARGETS)

save/%:
	docker save -o $(COMMIT_PATH)/$(notdir $@).tar $(subst save/,,$@)

load: $(LOAD_TARGETS)

load/%:
	docker load -i $(COMMIT_PATH)/$(notdir $@).tar

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
		-u $(UID):$(GID) \
		-e GIT_FULLNAME="$(GIT_FULLNAME)" \
		-e GIT_EMAIL="$(GIT_EMAIL)" \
		--network=host \
		-v $(HOME)/trx:/home/trx  \
		-v /var/run/docker.sock:/var/run/docker.sock \
		$(BASE_IMAGE)
	
