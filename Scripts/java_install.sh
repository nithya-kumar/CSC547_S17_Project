#!/bin/bash
clear
echo "Begin java installation"
apt-get update
apt-get upgrade
apt-get install default-jre
apt-get install default-jdk
java -version
