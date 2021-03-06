#!/bin/bash

REGISTRY_PREFIX=${REGISTRY_PREFIX:-demoregistry.dataman-inc.com/library/}
VERSION=`git log --pretty=format:'%h' -n 1`

docker run -it --rm -v $(pwd):/data -w /data digitallyseamless/nodejs-bower-grunt:5 ./compress.sh

docker build -f ./compress.Dockerfile -t ${REGISTRY_PREFIX}blackmamba:compress-${VERSION} .
