FROM golang:1.11-alpine AS builder

RUN set -eux \
	&& apk --update add --no-cache \
		bash \
		git \
		make

RUN echo "" > ~/.gitconfig \
    && git config --global url."https://github.com".insteadOf git://github.com \
    && git config --global http.https://gopkg.in.followRedirects true

WORKDIR /go/src/github.com/oinume/playground-kubernetes
ADD . /go/src/github.com/oinume/playground-kubernetes
RUN make build


FROM alpine
COPY --from=builder /go/src/github.com/oinume/playground-kubernetes/server /server

RUN set -eux \
	&& apk --update add --no-cache ca-certificates

EXPOSE ${PORT:-5000}

ENTRYPOINT ["/server"]
