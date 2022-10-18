#!/bin/bash

# EPGStation install
echo "EPGStation install and setup start!"
cd ~/
git clone https://github.com/l3tnun/EPGStation.git
cd EPGStation
npm run all-install
npm run build

# Cretate configure file
cp config/operatorLogConfig.sample.yml config/operatorLogConfig.yml
cp config/epgUpdaterLogConfig.sample.yml config/epgUpdaterLogConfig.yml
cp config/serviceLogConfig.sample.yml config/serviceLogConfig.yml
cp config/enc.js.template config/enc.js
cp ~/mirakurun-epgstation-install/conf/config.yml config/config.yml
cp -r ~/mirakurun-epgstation-install/bin/ .

# EPGStation start and enabled
sudo pm2 start dist/index.js --name "epgstation"
sudo pm2 save
echo "EPGStation install and setup done!"
