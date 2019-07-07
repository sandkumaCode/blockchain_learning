#!/usr/bin/env bash
docker build -t blockchainlearning/compose:1.0 .
docker build  -t blockchainlearning/composerest:1.0 -f Dockerfile_Rest .