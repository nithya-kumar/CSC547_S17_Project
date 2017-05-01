cd /opt
wget https://github.com/apache/lucene-solr/archive/releases/lucene-solr/6.3.0.tar.gz
mv 6.3.0.tar.gz solr-lucene-6.3.0.tar.gz
tar -xvzf solr-lucene-6.3.0.tar.gz
ln -s lucene-solr-releases-lucene-solr-6.3.0/ solr-lucene

useradd solr
chown -R solr:solr /opt/solr-lucene
sudo -iu solr

cd /opt/solr-lucene

#Need to check the jdk path
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

#Compilation problem because tools.jar not found in java 1.8 but if we keep as java 1.7, Solr demands min version 1.8.
#If this is resolved, foll. steps should work
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
