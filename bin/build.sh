#!/usr/bin/env bash

set -ex

docker build -t ${DOCKERHUB_USERNAME}/obsidian-workspace:develop ./obsidian