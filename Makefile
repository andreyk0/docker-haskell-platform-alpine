help:
	@echo "make build-image"
	@echo "make publish-image"

build-image:
	docker build --no-cache=true --tag andreyk0/docker-haskell-platform-alpine:latest .

publish-image:
	docker push andreyk0/docker-haskell-platform-alpine:latest
