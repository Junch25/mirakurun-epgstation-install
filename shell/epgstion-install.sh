#!/bin/bash

echo "EPGStation install!"
git clone https://github.com/l3tnun/EPGStation.git
cd ~/EPGStation
npm run all-install
npm run build

cp config/config.yml.template config/config.yml
cp config/operatorLogConfig.sample.yml config/operatorLogConfig.yml
cp config/epgUpdaterLogConfig.sample.yml config/epgUpdaterLogConfig.yml
cp config/serviceLogConfig.sample.yml config/serviceLogConfig.yml
cp config/enc.js.template config/enc.js