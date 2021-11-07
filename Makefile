DOCKER_IMAGE_VERSION=latest
DOCKER_IMAGE_NAME=zogspat/nodewpapiclient
PLATFORM=linux/arm64/v8

DOCKER_IMAGE_TAGNAME=$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

default: build

build:
	docker build --platform $(PLATFORM) -t $(DOCKER_IMAGE_TAGNAME) .
	docker tag $(DOCKER_IMAGE_TAGNAME) $(DOCKER_IMAGE_NAME):latest
push:
	docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)

run:
	docker run -p 8080:8080 -d $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)
version:
	docker run --rm $(DOCKER_IMAGE_TAGNAME) mysql --version

rmi:
	docker rmi -f $(DOCKER_IMAGE_TAGNAME)

rebuild: rmi build
