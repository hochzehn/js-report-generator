#!/usr/bin/env bash

docker build --tag report . > /dev/null
docker run --rm -v ${PWD}/source:/opt/app/source report
