#!/bin/bash

#=======================================[  Removing All Container From Docker History   ]=========================================
# Author : vheidari
# Email  : vahid-heidari@hotmail.com
# GitHub : https://github.com/vheidari/FullStack
# ----------------------------------------------------------------------------------------------------------------
# Note: This Script help you to remove all container from docker history, please be aware just run and use it in test environment !!!  
#

GET_ALL_CONTAINER=$(docker ps -a | awk 'NR>1 {print $1}')
NUMBER_OF_CONTAINER=${#GET_ALL_CONTAINER[@]}

echo "Please wait to remove all continer from Dockers history"
echo

for item in ${GET_ALL_CONTAINER[@]}; do
	docker rm $item >/dev/null
	echo "Successfully remove continer id : $item"
done

echo
echo "All $NUMBER_OF_CONTAINER are remove successfully ! :)"
