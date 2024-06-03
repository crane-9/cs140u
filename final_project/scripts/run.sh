#!/usr/bin/bash

containerName="multiserver-test"

sudo docker run --name $containerName -d multiserver 
