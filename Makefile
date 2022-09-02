ENGINE ?= docker

REGSITRY ?= ghcr.io
IMAGE_NAME ?= poussa/actions
IMG_TAG ?= latest
IMG ?= $(REGSITRY)/$(IMAGE_NAME):$(IMG_TAG)

DOCKER_BUILD_DEPS ?= enclave-config/privatekey.pem

docker-build: $(DOCKER_BUILD_DEPS)
	$(ENGINE) build $(BUILD_ARGS) -t $(IMG) .

enclave-config/privatekey.pem:
	openssl genrsa -3 -out enclave-config/privatekey.pem 3072

docker-push:
	docker push $(IMG)
