SHELL=/usr/bin/env bash
NAME:=$(shell basename $$(pwd))
ORG:=jwmarshall
TAG:=$(shell grep version package.json | awk -F\" '{ print $$4 }')
PUSH:=false

build:
	docker build -t $(ORG)/$(NAME):latest .
	docker tag $(ORG)/$(NAME):latest $(ORG)/$(NAME):$(TAG)

push: build
	docker push $(ORG)/$(NAME):latest
	docker push $(ORG)/$(NAME):$(TAG)

run: npm
	node run server.js
