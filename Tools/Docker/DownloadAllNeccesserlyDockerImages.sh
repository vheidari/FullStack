#!/bin/bash

#=======================================[ Download All Neccesserly Docker Image For Development  ]=========================================
# Author : vheidari
# Email  : vahid-heidari@hotmail.com
# GitHub : https://github.com/vheidari/FullStack
# ----------------------------------------------------------------------------------------------------------------
# Note: This Bash script help us to install all the neccessery images for development. you are free to change and cutomize it for personal purposes. 
#

echo "Start Downloding a list of usefull images from Docker Hub :) ..." 

Images=('nginx' 'rabbitmq' 'mongo' 'apache/kafka' 'mysql' 'postgres' 'scylladb/scylla' 'redis' 'node' 'php' 'golang' 'python' 'rust' 'hello-world')
ImgaesArrayLen=${#Image[@]}

for Item in ${Images[@]}; do 
	echo "Start Downloadin : $Item from Docker Hub"
	docker pull $Item >/dev/null

done


echo "All $ImagesArrayLen Images Downloaded Successfully :)"
