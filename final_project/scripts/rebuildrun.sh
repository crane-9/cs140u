#!/usr/bin/bash
containerName="multiserver-test"
dirPath=$(realpath $(dirname $0)/../)

sudo docker container stop $containerName
sudo docker container rm $containerName
sudo docker build -t multiserver $dirPath
sudo docker run --name $containerName -d multiserver 
