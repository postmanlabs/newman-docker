#!/bin/bash

set -e;

IMAGES_BASE_PATH="./images";

function test_docker_image {
    TAG=$(grep -oP "(?<=ENV\ NEWMAN_VERSION\ ).+" ${1}/Dockerfile);
    BASENAME=$(basename $1);

    docker run -v $PWD/test/data:/etc/newman -t postman/newman_${BASENAME}:${TAG} \
        run HTTPBinNewmanTest.json.postman_collection \
        -e HTTPBinNewmanTestEnv.json.postman_environment \
        --suppress-exit-code;

    docker run -t postman/newman_${BASENAME}:${TAG} \
        run https://www.getpostman.com/collections/8a0c9bc08f062d12dcda \
        --suppress-exit-code;
}

if [ -z "$1" ]; then
    for image in $IMAGES_BASE_PATH/*; do
        if [ -d "${image}" ] && [ -f "${image}/Dockerfile" ]; then
            test_docker_image ${image};
        fi
    done
else
    if [ -d "${IMAGES_BASE_PATH}/${1}" ] && [ -f "${IMAGES_BASE_PATH}/${1}/Dockerfile" ]; then
        test_docker_image ${IMAGES_BASE_PATH}/${1};
    else
        echo "Invalid image";
        exit 1;
    fi
fi
