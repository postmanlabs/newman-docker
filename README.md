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

```terminal
docker run hello-world
```

You should get an output like this

```terminal
Hello from Docker.
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (Assuming it was not already locally available.)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

For more examples and ideas, visit:
 http://docs.docker.com/userguide/
```

If instead you get any errors, then you need to either install, or fix your installation of docker. Docker has
extensive <a href="https://docs.docker.com/installation/" target="_blank">installation guidelines for popular
operating systems</a>

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
cd newman-docker/newman_ubuntu1404
docker build -t newman_ubuntu1404 .
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
docker run -v /etc/collections:/etc/newman -t postman/newman_ubuntu1404:1.2.17 -c PostmanDemoServer.json.postman_collection
```

You are not required to mount a volume if you do not need to save newman report to the host, and your collection is
available online(unless your collection requires an environment). To know more about mounting volumes, visit
<a href="https://docs.docker.com/userguide/dockervolumes/" target="_blank">docker documentation on shared data volumes</a>.
