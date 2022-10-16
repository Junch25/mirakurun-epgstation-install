#!/bin/bash

echo "EPGStation install!"
cd ~/
git clone https://github.com/l3tnun/EPGStation.git
cd EPGStation
npm run all-install
npm run build
echo "EPGStation install done!"

echo "EPGStation config copy!"
cp config/operatorLogConfig.sample.yml config/operatorLogConfig.yml
cp config/epgUpdaterLogConfig.sample.yml config/epgUpdaterLogConfig.yml
cp config/serviceLogConfig.sample.yml config/serviceLogConfig.yml
cp config/enc.js.template config/enc.js
cp ~/mirakurun-epgstation-install/conf/config.yml config/config.yml
cp -r mirakurun-epgstation-install/bin/ .
echo "EPGStation config copy done!"

echo "EPGStation start"
sudo pm2 start dist/index.js --name "epgstation"
sudo pm2 save