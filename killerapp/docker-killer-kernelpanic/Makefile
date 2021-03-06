# A simple monitor program for the cam and yolo services

# ----------------------------------------------------------------------------

ifndef DOCKER_BASE
$(error DOCKER_BASE is not set)
endif

# You must always use the Horizon name for architecture (`hzn architecture`)
export ARCH ?= $(shell hzn architecture)

# Import variables from hzn.json (file is generated by last target in this file)
-include .hzn.json.tmp.mk

# ----------------------------------------------------------------------------

# Build the docker container
build:
	docker build -t $(DOCKER_IMAGE_BASE)_$(ARCH):$(SERVICE_VERSION) -f ./Dockerfile.$(ARCH) .

# Push the docker container to the DockerHub registry
push:
	docker push $(DOCKER_IMAGE_BASE)_$(ARCH):$(SERVICE_VERSION)

# Publish a Horizon service (per service.json) and pull image to get its sha256
publish-service:
	hzn exchange service publish -f service.json --pull-image

# Publish a Horizon business policy (per service.json) 
publish-policy:
	hzn exchange business addpolicy --json-file=business-policy.json chaos.$(SERVICE_NAME)

# Remove the local container image
clean:
	@docker rmi $(DOCKER_IMAGE_BASE)_$(ARCH):$(SERVICE_VERSION) 2>/dev/null || :
	@rm -f .hzn.json.tmp.mk

# ----------------------------------------------------------------------------


# This imports the variables from hzn.json
.hzn.json.tmp.mk: hzn.json
	@ hzn util configconv -f $< > $@

