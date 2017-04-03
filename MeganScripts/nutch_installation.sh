sudo su
cd /opt
wget https://archive.apache.org/dist/nutch/2.2.1/apache-nutch-2.2.1-src.tar.gz
tar -xvzf  apache-nutch-2.2.1-src.tar.gz 
ln -s /opt/apache-nutch-2.2.1/ nutch

#update /opt/nutch/conf/nutch-site.xml

#Compiling nutch
cd /opt/nutch
/opt/ant/bin/ant rumtime

#Crawling the web
cd /opt/nutch/runtime/local
mkdir urls
echo "http://nutch.apache.org" > urls/seed.txt

