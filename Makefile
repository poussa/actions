REGSITRY ?= ghcr.io
IMAGE_NAME ?= poussa/actions
IMG ?= $(REGSITRY)/$(IMAGE_NAME)

docker-build:
	docker build ${BUILD_ARGS} -t $(IMG) .

docker-push:
	docker push $(IMG)
