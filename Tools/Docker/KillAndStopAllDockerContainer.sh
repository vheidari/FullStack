#!/bin/bash


#=======================================[ Killing and Stop Running All Docker Container   ]=========================================
# Author : vheidari
# Email  : vahid-heidari@hotmail.com
# GitHub : https://github.com/vheidari/FullStack
# ----------------------------------------------------------------------------------------------------------------
# Note:  Well, this bash script help us to kill and stop all runned cointainers. you should be aware don't use it in production environment and just use it in test environment!:
#


GET_ALL_CONTAINERS=$(docker ps | awk 'NR>1 {print $1}')

for item in ${GET_ALL_CONTAINERS[@]}; do 

	docker kill $item >/dev/null
	echo "Container ID : $item , has been killed !"

done;
