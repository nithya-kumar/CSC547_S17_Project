#!/bin/sh

clear
echo "------------Tika installation begins------------"

apt-get update
apt-get upgrade

wget http://www-eu.apache.org/dist/tika/tika-app-1.14.jar

echo "------------Tika installation ends------------"
