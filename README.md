<a href="https://travis-ci.org/postmanlabs/newman-docker" target="_blank"><img align="right" src="https://travis-ci.org/postmanlabs/newman-docker.svg?branch=develop" /></a>

# newman-docker

<img src="https://s3.amazonaws.com/web-artefacts/newman-128.png" />

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
docker -t postman/newman_ubuntu1404 --url="https://example.com/Github.json.postman_collection"
```

### Build the docker image from this repository

- ensure docker is installed
- git clone this repository
- build the image
- run the image with a sample collection url

## Running local collection files

This docker image is designed to pick files from the `/etc/newman` directory within the image. You may mount the 
directory of your collection files into that location and provide the file references in standard newman parameters. 


You are not required to mount a volume if you do not need to save newman report to the host, and your collection is 
available online. To know more about mounting volumes, visit 
<a href="https://docs.docker.com/userguide/dockervolumes/" target="_blank">docker documentation on shared data volumes</a>.