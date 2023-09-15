#!/usr/bin/env bash

set -ex

# build obsidian
docker build -t ${DOCKERHUB_USERNAME}/obsidian-workspace:develop ./obsidian

# build slack
docker build -t ${DOCKERHUB_USERNAME}/slack-workspace:develop ./slack