#!/usr/bin/env bash
TAG=":1"
DOCKER_IMAGE = "github.com/docker-library/compose"${TAG}
docker build -t $(DOCKER_IMAGE) .