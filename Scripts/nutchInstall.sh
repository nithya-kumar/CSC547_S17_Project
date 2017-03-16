#!/bin/sh

ChangeInFiles()
{
	ptrnFound=`grep -e "$word2find" "$fileName"`
	if test "$ptrnFound" = ""
	then
		echo "[ Failed   ]\t$fileName"
		echo "The  pattern is "$word2find
	else
		echo "[ Modified ]\t$fileName"
		sed  "s/$word2find/$word2replace/g" $fileName > "temp";mv "temp" $fileName;rm -rf "temp"
	fi
}

editFiles()
{
	fileName="$nutchPath/conf/regex-urlfilter.txt"
  word2find="+."
  word2replace="#+."
  ChangeInFiles
	
	fileName="$nutchPath/conf/nutch-site.xml"
	word2find="<configuration>"
	word2replace="<configuration>\ <property>\ <name>http.agent.name<\/name>\ <value>My Nutch<\/value>\ <\/property>"
}
	

clear
echo "------------Nutch installation begins------------"

apt-get update
apt-get upgrade

wget "http://www-eu.apache.org/dist/nutch/1.12/apache-nutch-1.12-bin.tar.gz"

nutchHome = /usr/local/nutch
mkdir $nutchHome
mkdir $nutchHome/framework
mkdir $nutchHome/dist

cd $nutchHome/dist
wget "http://www-eu.apache.org/dist/nutch/1.12/apache-nutch-1.12-bin.tar.gz"

tar -xvzf apache-nutch-1.12-bin.tar.gz -C $nutchHome/framework/

nutchPath = $nutchHome/framework/apache-nutch-1.12

chmod +x $nutchPath/bin/nutch

mkdir $nutchPath/bin/urls

editFiles

# This inputUrls.txt should be fetched from user. Not sure if this is right.
cp inputUrls.txt $nutchPath/bin/urls/seed.txt

# Then add the urls from seed.txt in this format into $nutchPath/conf/regex-urlfilter.txt
# +^http://([a-z0-9]*\.)* www.csc.ncsu.edu/
# +^http://([a-z0-9]*\.)* www.ncsu.edu/

echo "------------Nutch installation ends------------"

# bin/crawl -i -D solr.server.url=http://localhost:8983/solr/ bin/urls testcrawl/ 2
