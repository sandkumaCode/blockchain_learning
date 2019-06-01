#!/usr/bin/env bash
DOCKER_IMAGE = bl/compose
docker build -t $(DOCKER_IMAGE) .