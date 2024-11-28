#!/bin/bash

#=======================================[  Base64 Encoder/Decoder  ]=========================================
# Author : vheidari
# Email  : vahid-heidari@hotmail.com
# GitHub : https://github.com/vheidari/FullStack
# ----------------------------------------------------------------------------------------------------------------
# Note:  InsallDockerOnUbuntu.sh help us to download and install docker engine and docker desktop on the Linux Ubuntu
#

# Get System Proxy Settings
PROXY_URL=${http_proxy}

# --------------------------------------------------------------------------------------------------------
# Install Docker Engine And Its Dependencies :
#

# Distination URL Parts 
BASE_URL="https://download.docker.com/linux/ubuntu/dists/"
UBUNTU_CODENAME=$(cat /etc/os-release  | grep UBUNTU_CODENAME | sed -e "s/UBUNTU_CODENAME=//")
VERSION_TYPE="/pool/stable"
SYSTEM_ARCH="/amd64/"

# Distination URL to download tools
POOL_URL="${BASE_URL}${UBUNTU_CODENAME}${VERSION_TYPE}${SYSTEM_ARCH}"


# Get list of Tools And Service 
CLEAN_OUTPUT=$(curl -L --proxy ${PROXY_URL} ${POOL_URL} 2>/dev/null | grep -o -iE 'href="([a-z].*)"' | sed -e 's/href="//' | sed -e 's/"/\n/')

# Get latest version of each tool
CONTAINERD=$(echo $CLEAN_OUTPUT | sed -e "s/ /\n/g" | grep -o -iE '(^containerd)(.*)(.deb)' | tail -1)
DOCKER_BUILDX_PLUGIN=$(echo $CLEAN_OUTPUT | sed -e "s/ /\n/g" | grep -o -iE '(^docker-buildx-plugin)(.*)(.deb)' | tail -1)
DOCKER_CE_CLI=$(echo $CLEAN_OUTPUT | sed -e "s/ /\n/g"  | grep -o -iE '(^docker-ce-cli)(.*)(.deb)' | tail -1)
DOCKER_CE_ROOTLESS_EXTRAS=$(echo $CLEAN_OUTPUT | sed -e "s/ /\n/g" | grep -o -iE '(^docker-ce-rootless-extras)(.*)(.deb)' | tail -1)
DOCKER_CE=$(echo $CLEAN_OUTPUT | sed -e "s/ /\n/g" | grep -o -iE '(^docker-ce)(.*)(.deb)' | tail -1)
DOCKER_COMPOSE_PLUGIN=$(echo $CLEAN_OUTPUT | sed -e "s/ /\n/g" | grep -o -iE '(^docker-compose-plugin)(.*)(.deb)' | tail -1)


# Arrays Of Tools
SERVICES=(${CONTAINERD} ${DOCKER_BUILDX_PLUGIN} ${DOCKER_CE_CLI} ${DOCKER_CE_ROOTLESS_EXTRAS} ${DOCKER_CE} ${DOCKER_COMPOSE_PLUGIN})

echo 
echo "Start Downloading Docker Engine Services ..."
echo 


# Download All Service 
for item in ${SERVICES[@]}; do

	if [ -e $item ]; then
		echo "File ${item} already exists :)"
		echo "-------------------------------------------------------------------------"
	else
		echo "Please Wait to Download ${item} file to finish ... !"
		curl -L --proxy ${PROXY_URL} -O ${POOL_URL}$item 2>/dev/null
		echo "-------------------------------------------------------------------------"
	fi
done


echo 
echo "Start installing Docker Engine Services ..."
echo 

# Install All Service
for item in ${SERVICES[@]}; do

	echo "Please Wait to Install ${item} file !"
	apt install ./$item -y
	echo "-------------------------------------------------------------------------"
	echo 
done



# --------------------------------------------------------------------------------------------------------
# Install Docker Desktop :
#

DOCKER_DESKTOP_URL="https://desktop.docker.com/linux/main${SYSTEM_ARCH}docker-desktop-amd64.deb"
DOCKER_DESKTOP_DEB_PACKAGE="docker-desktop-amd64.deb"

echo 
echo "Start Downloading  Docker Desktop .deb Package ..."
echo 

if [ -e $DOCKER_DESKTOP_DEB_PACKAGE ]; then
	echo "File ${DOCKER_DESKTOP_DEB_PACKAGE} already exists :)"
	echo "-------------------------------------------------------------------------"
else
	echo "Please Wait to Download ${DOCKER_DESKTOP_DEB_PACKAGE} file to finish ... !"
	curl -L --proxy ${PROXY_URL} -O ${DOCKER_DESKTOP_URL} 2>/dev/null
	echo "-------------------------------------------------------------------------"
fi

echo "Please Wait to Install ${DOCKER_DESKTOP_DEB_PACKAGE} file !"
apt install ./$DOCKER_DESKTOP_DEB_PACKAGE -y
echo "-------------------------------------------------------------------------"
echo 
