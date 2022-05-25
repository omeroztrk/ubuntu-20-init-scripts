#!/bin/bash

if [[ `whoami` != root ]]
then
	echo [!] You need to run this script as root
	echo [!] Trying to be root
	sudo $0
	exit
fi

# General init
apt update -y
apt upgrade -y

# Run 
apt install -y git
apt install -y sudo
apt install -y vim
apt install -y nano
apt install -y curl
apt install -y wget

apt install -y python3
apt install -y python3-pip

# For following scripts
chmod -R +x * 

WANNA_ALL=0

WANNA_MONGO=0
if [ $WANNA_MONGO = 1 ] || [ $WANNA_ALL = 1 ]
then
	echo [+] calling mongo install
	./install_mongo.sh
else
	echo [-] skipping mongo install
fi

WANNA_DOCKER=0
if [ $WANNA_DOCKER = 1 ] || [ $WANNA_ALL = 1 ] 
then
	echo [+] calling docker install
	./install_docker.sh
else
	echo [-] skipping docker install
fi

WANNA_GO=0
if [ $WANNA_GO = 1 ] || [ $WANNA_ALL = 1 ]
then
	echo [+] calling go install
	./install_go.sh
else
	echo [-] skipping go install
fi
