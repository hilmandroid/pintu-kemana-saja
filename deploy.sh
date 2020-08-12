#!/bin/bash

if [ $# -ne 2 ]; then
    echo ""
    echo " Usage: ./deploy.sh [SERVICE_NAME] [ENV]"
    echo ""
    exit 1
fi

SERVICE_NAME=$1
ENV=$2

if ! [[ "${ENV}" = "staging"  ||  "${ENV}" = "prod" ]]; then
    echo ""
    echo " ENV should be staging or prod"
    echo ""
    exit 1
fi

helm install --create-namespace=true -f "./${SERVICE_NAME}/helm/${ENV}.yaml" "${SERVICE_NAME}" "./${SERVICE_NAME}/helm" -n "${ENV}" 2> /dev/null

if [ $? -ne 0 ]; then
    helm upgrade --create-namespace=true -f "./${SERVICE_NAME}/helm/${ENV}.yaml" "${SERVICE_NAME}" "./${SERVICE_NAME}/helm" -n "${ENV}"
fi
