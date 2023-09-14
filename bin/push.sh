#!/usr/bin/env bash

## Documentation
#
# Expects the following env variables to exist
# DOCKERHUB_USERNAME (which holds your dockerhub username)
# DOCKERHUB_TOKEN (which holds your dockerhub token)

set -ex

# Login to dockerhub
echo ${DOCKERHUB_TOKEN} | docker login -u ${DOCKERHUB_USERNAME} --password-stdin

# Push our image
docker push ${DOCKERHUB_USERNAME}/obsidian-workspace:develop