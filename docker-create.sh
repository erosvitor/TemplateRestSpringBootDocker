#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script." 2>&1
  exit 1
fi

#################################################################################
# Unpack the fat JAR
#################################################################################
javapath="/opt/cts/env/java-11/jdk-11.0.7/bin"
mkdir target/dependency
cd target/dependency
${javapath}/jar -xf ../*.jar
cd ../..

#################################################################################
# Defining variables
#################################################################################
imagename="rest-springboot:1.0"
containername="rest-springboot-container"

#################################################################################
# Building image
#################################################################################
docker build -t ${imagename} .

#################################################################################
# Running container
#################################################################################
docker run -d \
           --restart always \
           -p 8080:8080 \
           --name ${containername} \
           ${imagename}
