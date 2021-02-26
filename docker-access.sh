#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script." 2>&1
  exit 1
fi

containername="rest-springboot-container"

docker exec -i -t ${containername} sh