#!/usr/bin/env bash

timestamp=$1
image="ylihit/catnip"  
tag=${image}:$timestamp

docker build -t $tag .

docker login -uylihit -pIamly+19920214 docker.io

docker push ylihit/catnip

