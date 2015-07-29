# newman-docker <a href="https://travis-ci.org/postmanlabs/newman-docker" target="_blank"><img src="https://travis-ci.org/postmanlabs/newman-docker.svg?branch=develop" /></a> <a href="https://gitter.im/postmanlabs/newman-docker" target="_blank"> <img src="https://badges.gitter.im/Join%20Chat.svg" /></a>

<img src="https://s3.amazonaws.com/web-artefacts/newman-128.png">

This repository contains docker images for Newman.

<a href="https://github.com/postmanlabs/newman" target="_blank">Newman</a> is a command-line collection runner for
<a href="https://getpostman.com" target="_blank">Postman</a>. It allows you to effortlessly run and test a
<a href="https://www.getpostman.com/docs/collections" targte="_blank">Postman Collections<a/> directly from the
command-line. It is built with extensibility in mind so that you can easily integrate it with your continuous
integration servers and build systems.

**New to Docker?** Docker allows you to package an application with all of its dependencies into a standardised unit for
software development. Visit
<a href="https://www.docker.com/whatisdocker" target="_blank">https://www.docker.com/whatisdocker</a> to read more about
how docker can drastically simplify development and deployment.

## Using the docker image

The docker image for Newman is available for download from our docker hub. You must have Docker installed in your
system. Docker has extensive <a href="https://docs.docker.com/installation/" target="_blank">installation guideline for
popular operating systems</a>. Choose your operating system and follow the instructions.

> Ensure you that you have docker installed and running in your system before proceeding with next steps. A quick test
> to see if docker is installed correctly is to execute the command `docker run hello-world` and it should run without
> errors.

**Step 1:**

Pull the <a href="https://registry.hub.docker.com/u/postman/newman_ubuntu1404/" target="_blank">newman docker
image</a> from docker hub:

```terminal
docker pull postman/newman_ubuntu1404;
```

**Step 2:**

Run newman commands on the image:

```terminal
docker run -t postman/newman_ubuntu1404 --url="https://www.getpostman.com/collections/4a287759fe7efe6b0f20"
```

### Build the docker image from this repository


**Step 1:**

Clone this repository:

```terminal
git clone https://github.com/postmanlabs/newman-docker.git
```

**Step 2:**

Build the image:

```terminal
docker build -t postman/newman_ubuntu1404 docker-newman/newman_ubuntu1404
```

**Step 3:**

Run a collection using the newman image:

```terminal
docker run -t postman/newman_ubuntu1404 --url="https://www.getpostman.com/collections/4a287759fe7efe6b0f20"
```


## Running local collection files

This docker image is designed to pick files from the `/etc/newman` directory within the image. You may mount the
directory of your collection files into that location and provide the file references in standard newman parameters.


```terminal
# Mount host collections folder ~/collections, onto /etc/newman on the docker image, so that newman
# has access to collections
docker run -v ~/collections:/etc/newman -t postman/ubuntu_1404 --collection="PostmanDemoServer.json.postman_collection"
```

You are not required to mount a volume if you do not need to save newman report to the host, and your collection is
available online, unless your collection requires an environment(as environments cannot be passed as URLs).

To know more about mounting volumes, visit
<a href="https://docs.docker.com/userguide/dockervolumes/" target="_blank">docker documentation on shared data volumes</a>.


## Examples

Run a local collection, pass an environment to it, and save the HTML report on the host.

```terminal
docker run -v ~/collections:/etc/postman -t postman/newman_ubuntu1404 \
    --collection="PostmanDemoServer.json.postman_collection" \
    --environment="PostmanBin.postman_environment" \
    --html="newman-results.html"
```

Run a remote collection, pass it a local environment, and save JUnit XML test report on the host

```terminal
docker run -v ~/collections:/etc/postman -t postman/newman_ubuntu1404 \
    --url="https://www.getpostman.com/collections/4a287759fe7efe6b0f20" \
    --environment="PostmanBin.postman_environment" \
    --testReportFile="newman-report.xml"
```

 Import a Postman backup file, and save collections, environments, and globals
 
 ```terminal
docker run -v ~/collections:/etc/postman -t postman/ubuntu_1404 --import="Backup.postman_dump" --pretty
```

Use a script to run a collection and do something, for example deploy the build, if all the tests pass

```bash
#/bin/bash

# Stop on first error
set -e;

function onExit {
    if [ "$?" != "0" ]; then
        echo "Tests failed";
        # build failed, don't deploy
        exit 1;
    else
        echo "Tests passed";
        # deploy build
    fi
}

#
trap onExit EXIT;

docker run -t postman/newman_ubuntu1404 --url="https://www.getpostman.com/collections/4a287759fe7efe6b0f20" --exitCode;
```
