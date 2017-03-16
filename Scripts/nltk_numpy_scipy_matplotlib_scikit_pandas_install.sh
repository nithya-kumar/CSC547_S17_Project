#!/bin/bash
clear
echo "Begin installation"
apt-get update
apt-get upgrade
pip install -U nltk
pip install numpy
pip install scipy
pip install matplotlib
pip install -U scikit-learn
pip install pandas


