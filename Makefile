DOCKER_IMG_BASE:=andreyk0/docker-haskell-platform-alpine
DOCKER_IMG_LATEST:=$(DOCKER_IMG_BASE):latest
DOCKER_IMG_DATE_TAG:=$(DOCKER_IMG_BASE):$(shell date "+%Y-%m-%d")

help:
	@echo "make build-image"
	@echo "make publish-image"

build-image:
	docker build --no-cache=true --tag $(DOCKER_IMG_LATEST) .
	docker tag $(DOCKER_IMG_LATEST) $(DOCKER_IMG_DATE_TAG)

publish-image:
	docker push $(DOCKER_IMG_LATEST)
	docker push $(DOCKER_IMG_DATE_TAG)
