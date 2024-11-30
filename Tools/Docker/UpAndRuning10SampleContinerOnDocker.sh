#!/bin/bash

#=======================================[  Up and Running 10 Containers on the Docker  ]=========================================
# Author : vheidari
# Email  : vahid-heidari@hotmail.com
# GitHub : https://github.com/vheidari/FullStack
# ----------------------------------------------------------------------------------------------------------------
# Note:  This script help you testing your docker engine, it help you pull down hello-world image from docker hub then simultancly tried runned 10 instance from it
#

IMAGE_NAME=hello-world

isHelloWorldImageExist=$(docker images | grep $IMAGE_NAME | awk '{print $1}')

if [[ ${isHelloWorldImageExist} != $IMAGE_NAME ]]; then

	echo "Start downloading $IMAGE_NAME image from docker hub"
	echo 

	# pulling down image through docker engine cli
	docker pull $IMAGE_NAME

fi


source ./RemoveAllContainerFromDockerHistory.sh

echo "Start creating and running 10 container instance from $IMAGE_NAME image file"
echo 


for i in {0..9}; do 
	docker run -d --name "$i.$IMAGE_NAME" -h "$i.hello_World" $IMAGE_NAME 
	
	echo "[$i of 10] : successfully up and runing container $i.$IMAGE_NAME."
done

echo

docker ps -a

echo 
echo "Note	: The test is completed; all 10 containers are running. To kill all test containers, you can run the KillAllDockerContainer.sh script. :) "
echo "Note 2 	: For the test, we use the hello-world image to run our tests by default. As you should know, this image does not run in the background; for this reason, KillAllDockerContainer.sh will not affect the containers"
echo "    	  Because they are already running and have been killed. However, if you want to test this script with other images, after running the test, you can use KillAllDockerContainer.sh to kill all background running containers. "
ec
