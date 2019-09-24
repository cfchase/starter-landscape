#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

APPLICATION_NAME=${APPLICATION_NAME:-starter-landscape}
ROUTE_NAME=${ROUTE_NAME:-starter}
REPLICAS=${REPLICAS:-1}
IMAGE_REPOSITORY=${IMAGE_REPOSITORY:-quay.io/cfchase/starter-landscape:latest}

echo "Deploying ${IMAGE_REPOSITORY}"

oc process -f ${DIR}/templates/webserver.yml \
  -p APPLICATION_NAME=${APPLICATION_NAME} \
  -p ROUTE_NAME=${ROUTE_NAME} \
  -p REPLICAS=${REPLICAS} \
  -p IMAGE_REPOSITORY=${IMAGE_REPOSITORY} \
  | oc create -f -
