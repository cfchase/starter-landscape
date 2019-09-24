#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

IMAGE_REPOSITORY=${IMAGE_REPOSITORY:-quay.io/cfchase/starter-landscape:latest}

echo "Building ${IMAGE_REPOSITORY} from local"

cd ${DIR}/..
rm -rf dist lookup.json data.json
npm install
npm run build
s2i build ./dist centos/nginx-114-centos7 ${IMAGE_REPOSITORY}
