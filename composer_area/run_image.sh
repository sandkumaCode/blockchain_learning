#!/usr/bin/env bash
# replace with hostip of the interface that is public as of now bound to l0
docker run -it -p 127.0.0.1:8080:5000/tcp blockchainlearning/compose:1.0 /bin/sh