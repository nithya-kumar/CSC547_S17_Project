cd /opt
wget http://archive.apache.org/dist/lucene/solr/6.3.0/solr-6.3.0-src.tgz

tar -xvzf solr-6.3.0-src.tgz 
ln -s /opt/solr-6.3.0 solr-lucene

sudo adduser solr

chown -R solr:solr /opt/solr-lucene
sudo -iu solr

cd /opt/solr-lucene

#Need to check the jdk path
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/

/opt/ant/bin/ant ivy-bootstrap
/opt/ant/bin/ant compile
/opt/ant/bin/ant jar
cd solr
/opt/ant/bin/ant dist
/opt/ant/bin/ant process-webpages
mkdir /opt/solr-lucene/solr/contrib/uima/lucene-libs
cd /opt/solr-lucene/solr/contrib/uima/lucene-libs
ln -s /opt/solr-lucene/lucene/build/analysis/common/lucene-analyzers-common-6.3.0-SNAPSHOT.jar lucene-analyzers-common.jar
ln -s /opt/solr-lucene/lucene/build/analysis/uima/lucene-analyzers-uima-6.3.0-SNAPSHOT.jar lucene-analyzers-uima.jar

cd /opt/solr-lucene/solr
/opt/ant/bin/ant server
chmod +x ./bin/*
./bin/solr start 
./bin/solr create -c nutch_core
./bin/solr create -c mortar_core
./bin/solr create -c uima_core
