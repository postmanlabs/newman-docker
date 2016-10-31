#!/bin/bash

set -e;

IMAGES_BASE_PATH="./images";
CURRENT_BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

function build_docker_image {
    TAG=$(grep -oP "(?<=ENV\ NEWMAN_VERSION\ ).+" ${1}/Dockerfile);
    BASENAME=$(basename $1);

    if [ $CURRENT_BRANCH = "master" ]; then
        docker build -t postman/newman_${BASENAME}:${TAG} -t postman/newman_${BASENAME}:latest ${1};
    else
        docker build -t postman/newman_${BASENAME}:${TAG} ${1};
    fi
}

if [ -z "$1" ]; then
    for image in $IMAGES_BASE_PATH/*; do
        if [ -d "${image}" ] && [ -f "${image}/Dockerfile" ]; then
            build_docker_image ${image};
        fi
    done
else
    if [ -d "${IMAGES_BASE_PATH}/${1}" ] && [ -f "${IMAGES_BASE_PATH}/${1}/Dockerfile" ]; then
        build_docker_image ${IMAGES_BASE_PATH}/${1};
    else
        echo "Invalid image";
        exit 1;
    fi
fi
