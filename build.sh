#!/usr/bin/env bash

image="ylihit/catnip"
timestamp=$(date +%Y%m%d%H%M%S)  
tag=$image:$timestamp

docker build -t $tag .

docker login -uylihit -pIamly+19920214 docker.io

docker push ylihit/catnip

