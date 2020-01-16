#!/usr/bin/env bash

tag=$1

docker build -t $tag ./config/.

docker login -uylihit -pIamly+19920214 docker.io

docker push ylihit/catnip

