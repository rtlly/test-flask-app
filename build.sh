#!/usr/bin/env bash

image="ylihit/catnip"  
tag=$image:$TIME_STAMP

docker build -t $tag .

docker login -uylihit -pIamly+19920214 docker.io

docker push ylihit/catnip

