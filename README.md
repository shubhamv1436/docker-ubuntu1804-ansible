# Ubuntu 18.04 LTS Ansible Docker Image
[![Build Status](https://travis-ci.com/shubhamv1436/docker-ubuntu1804-ansible.svg?branch=master)](https://travis-ci.com/shubhamv1436/docker-ubuntu1804-ansible)  [![Docker Automated build](https://img.shields.io/docker/cloud/automated/shubhamv1436/docker-ubuntu1804-ansible.svg?maxAge=2592000)](https://hub.docker.com/r/shubhamv1436/docker-ubuntu1804-ansible)
[![Docker Build Status](https://img.shields.io/docker/cloud/build/shubhamv1436/docker-ubuntu1804-ansible)](https://hub.docker.com/r/shubhamv1436/docker-ubuntu1804-ansible/builds)

Ubuntu 18.04 LTS Docker container for Ansible testing.

## Tags

  - `latest`: Latest stable version of Ansible, on Python 2.7.x.
  - `python2`: (Deprecated) Same as `latest`.

## How to Build

This image is built on Docker Hub automatically any time the upstream OS container is rebuilt, and any time a commit is made or merged to the `master` branch. But if you need to build the image on your own locally, do the following:

  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. `cd` into this directory.
  3. Run `docker build -t docker_ubuntu1804_ansible .`

## How to Use

  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. Pull this image from Docker Hub: `docker pull shubhamv1436/docker_ubuntu1804_ansible:latest` (or use the image you built earlier, e.g. `docker_ubuntu1804_ansible:latest`).
  3. Run a container from the image: `docker run -d --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro shubhamv1436/docker_ubuntu1804_ansible:latest`.
  4. Use Ansible inside the container:
  
  a. Check ansible version: `docker exec --tty [container_id] env TERM=xterm ansible --version`
  
  b. Switch to container: `docker exec --tty [container_id] env TERM=xterm bash`

## Author

Created in 2020 by **Shubham Vaishnav**