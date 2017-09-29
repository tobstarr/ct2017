FROM golang:1.9-alpine

RUN apk update && apk add ca-certificates

COPY main.go /tmp/main.go

RUN go build -o /usr/local/bin/basic-auth-proxy /tmp/main.go

ENTRYPOINT ["/usr/local/bin/basic-auth-proxy"]
