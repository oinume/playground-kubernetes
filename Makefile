IMAGE_TAG ?= latest

all: build

build:
	go build -o server main.go

docker/build:
	docker build --pull -f Dockerfile \
	--tag lekcije/server:$(IMAGE_TAG) \
	--tag asia.gcr.io/oinume-playground-kubernetes/server:$(IMAGE_TAG) .

clean:
	rm -f server