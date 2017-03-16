#!/bin/bash
clear
echo "Begin installation"
apt-get update
apt-get upgrade
#make sure pip is installed first
sudo apt-get install python-dev python-virtualenv
virtualenv --system-site-packages ~/tensorflow
source ~/tensorflow/bin/activate
pip install --upgrade tensorflow
#to verify
#source ~/tensorflow/bin/activate
#python
#import tensorflow as tf
#hello = tf.constant('Hello, TensorFlow!')
#sess = tf.Session()
#print(sess.run(hello))
#exit()
#deactivate
