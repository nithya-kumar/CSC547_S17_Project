#!/bin/bash
clear
echo "begine the installation"

apt-get update
apt-get upgrade

wget https://repo.continuum.io/archive/Anaconda2-4.3.1-Linux-x86_64.sh
bash Anaconda2-4.3.1-Linux-x86_64.sh
# agree to everything
wget https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh
bash Anaconda3-4.3.1-Linux-x86_64.sh
# agree to everything

conda create --name myapp flask sqlalchemy
conda env list
conda remove --name myapp --a

apt-get install nodejs
apt-get install npm

npm install d3

nodejs --version
npm --version
