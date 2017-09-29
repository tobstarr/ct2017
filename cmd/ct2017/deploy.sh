#!/bin/bash
set -e -o pipefail

SHA=$(find . -type f | sort | xargs cat | md5sum | awk '{ print $1 }' | cut -b 1-12)

IMAGE_TAG=tobstarr/ct2017:${SHA}

docker build --build-arg REVISION=${SHA} -t ${IMAGE_TAG} .
echo "built ${IMAGE_TAG}"
kubectl set image deployments/ct2017 "*=${IMAGE_TAG}"
kubectl rollout status deployments/ct2017
