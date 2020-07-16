
all:
    $(eval GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD | sed 's/\//-/g'))
    $(eval GIT_COMMIT=$(shell git log -1 --format=%h ))
    TAG ?= $(GIT_BRANCH)-$(GIT_COMMIT)
    REPO ?= $(REGISTRY)/token-vesting-ui

.PHONY: build
build:
	./gradlew shadowJar

.PHONY: package
package: build
	docker build -t $(REPO):$(TAG) .

.PHONY: publish
publish: package
	docker push $(REPO):$(TAG)