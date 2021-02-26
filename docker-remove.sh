#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script." 2>&1
  exit 1
fi

#################################################################################
# Defining variables
#################################################################################
imagename="rest-springboot:1.0"
containername="rest-springboot-container"

#################################################################################
# Removing container and image
#################################################################################
docker stop ${containername}
docker rm ${containername}
docker rmi ${imagename}