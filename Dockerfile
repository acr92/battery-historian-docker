FROM ubuntu:16.04
MAINTAINER Arne-Christian Blystad <arne.christian@blystad.me>

RUN apt-get update
RUN apt-get install python golang openjdk-8-jre-headless git -yy

RUN mkdir /go
ENV GOPATH /go
RUN go get -d -u github.com/google/battery-historian
WORKDIR ${GOPATH}/src/github.com/google/battery-historian
RUN go run setup.go

EXPOSE 9999
CMD go run cmd/battery-historian/battery-historian.go --port 9999

