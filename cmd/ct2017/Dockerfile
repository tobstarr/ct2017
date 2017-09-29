FROM golang:1.9-alpine

RUN apk update && apk add ca-certificates

RUN mkdir -p /go/src/github.com/tobstarr/code-talks-2017 /app
COPY . /go/src/github.com/tobstarr/code-talks-2017/cmd/ct2017/

ARG REVISION=HEAD
RUN echo -n $REVISION > /app/REVISION
WORKDIR /app

RUN go build -o /usr/local/bin/ct2017 github.com/tobstarr/code-talks-2017/cmd/ct2017

ENTRYPOINT ["/usr/local/bin/ct2017"]
