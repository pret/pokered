#!/bin/sh
set -ex

srcDir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
imgName="pokered-builder"

# build rom inside docker
docker build \
    --target build \
    -t "${imgName}" \
    "${srcDir}"

# copy rom from docker image to source directory
docker build \
    --target output \
    -t "${imgName}" \
    --output \
    "${srcDir}" \
    "${srcDir}"
