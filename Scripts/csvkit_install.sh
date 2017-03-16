#!/bin/sh

clear
echo "------------CSV Kit installation begins------------"

apt-get install python-dev python-pip python-setuptools build-essential
pip install csvkit
pip install --upgrade pip

echo "------------CSV Kit installation ends------------"
