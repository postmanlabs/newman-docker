FROM ubuntu:14.04.2

MAINTAINER Postman Labs <mail@postmanlabs.com>

RUN apt-get update && apt-get install -y \
    curl \
    git \
    npm;

ENV NODE_VERSION="0.12.6" \
    NEWMAN_VERSION="1.2.17"

RUN npm install -g n && \
    n ${NODE_VERSION} && \
    npm install -g newman@${NEWMAN_VERSION};

WORKDIR /var/newman-docker

VOLUME /tmp:/var/results

CMD newman -u ${COLLECTION_URL} -H /var/results/newman-run.html
