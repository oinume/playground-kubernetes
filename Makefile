IMAGE_TAG ?= latest
VERSION_HASH_VALUE = $(shell git rev-parse HEAD | cut -c-7)

all: build

build:
	go build -o server src/main.go

docker/build:
	docker build --pull -f Dockerfile \
	--tag lekcije/server:$(IMAGE_TAG) \
	--tag asia.gcr.io/oinume-lekcije/server:$(IMAGE_TAG) .

clean:
	rm -f server