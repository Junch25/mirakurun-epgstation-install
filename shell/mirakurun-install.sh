#!/bin/bash

echo "mirakurun install!"
npm install arib-b25-stream-test -g --unsafe-perm
npm install pm2 -g
npm install mirakurun -g --production
echo "mirakurun install done!"

echo "conf file reame"
mv /usr/local/etc/mirakurun/tuners.yml /usr/local/etc/mirakurun/tuners.yml.old
echo "conf file reame done!"

echo "select tuners"
echo "1.Q3PE4 2.W3PE4 3.tuners-15ch >"
read menu

# tuners Q3PE4
if [$menu = 1]; then
    cp ../conf/tuners-Q3PE4.yml /usr/local/etc/mirakurun/
    mv /usr/local/etc/mirakurun/tuners-Q3PE4.yml /usr/local/etc/mirakurun/tuners.yml
    mirakurun init
    mirakurun restart

# tuners W3PE4
elif [$menu = 2]; then
    cp ../conf/tuners-W3PE4.yml /usr/local/etc/mirakurun/
    mv /usr/local/etc/mirakurun/tuners-W3PE4.yml /usr/local/etc/mirakurun/tuners.yml
    mirakurun init
    mirakurun restart

# tuners 15ch
elif [$menu = 3]; then
    cp ../conf/tuners-15ch.yml /usr/local/etc/mirakurun/
    mv /usr/local/etc/mirakurun/tuners-15ch.yml /usr/local/etc/mirakurun/tuners.yml
    mirakurun init
    mirakurun restart

else
    echo "error"
fi