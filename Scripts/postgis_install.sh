wget http://postgis.refractions.net/download/postgis-1.4.3SVN.tar.gz
tar -xvzf postgis-1.4.3SVN.tar.gz

cd postgis-1.4.3SVN
./configure
make
make install
