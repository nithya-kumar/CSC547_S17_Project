#!/bin/bash
clear
echo "Begin installation"
apt-get update
apt-get upgrade
cd /tmp
wget http://apache.mirrors.pair.com/lucene/solr/6.4.2/solr-6.4.2.tgz
tar xzf solr-6.4.2.tgz solr-6.4.2/bin/install_solr_service.sh --strip-components=2
./install_solr_service.sh solr-6.4.2.tgz
service solr status
sudo su - solr -c "/opt/solr/bin/solr create -c gettingstarted -n data_driven_schema_configs"
apt-get update
dpkg -L solr-tomcat
apt-get install solr-tomcat
