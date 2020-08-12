#!/bin/bash

set -e

if [ $# -ne 1 ]; then
    echo ""
    echo " Usage: ./build-image.sh [SERVICE_NAME]"
    echo ""
    exit 1
fi

SERVICE_NAME=$1

cd "${SERVICE_NAME}"
docker build . -t "${SERVICE_NAME}:latest"
docker image tag "${SERVICE_NAME}:latest" "docker.io/hilmandroid/${SERVICE_NAME}:latest"
docker push "docker.io/hilmandroid/${SERVICE_NAME}:latest"