#!/bin/bash

TUNER1 = "tuners-Q3PE4"
TUNER2 = "tuners-W3PE4"
TUNER3 = "tuners-15ch"

CURRENT="$HOME/mirakurun-epgstation-install/"
echo "Dir: $CURRENT"

function mirakurun_install() {
    sudo npm install arib-b25-stream-test -g --unsafe-perm
    sudo npm install pm2 -g
    sudo npm install mirakurun -g --production
    return 0
}

# Mirakurun setuo
# 1.Q3PE4 2.W3PE4 3.tuners-15ch
function mirakurun_setup() {
    echo "Select tuners configuration yaml"
    select TUNER in "$TUNER1" "$TUNER2" "$TUNER3" "exit"
    do
        if [ $TUNER = exit ];then
        break
    else
        echo $TUNER
        sudo rm /usr/local/etc/mirakurun/tuners.yml
        sudo cp $CURRENT/conf/$TUNER.yml /usr/local/etc/mirakurun/
        sudo mv /usr/local/etc/mirakurun/$TUNER.yml /usr/local/etc/mirakurun/tuners.yml
        ls -lah /usr/local/etc/mirakurun/
        sudo mirakurun init
        sudo mirakurun restart
    fi
    done
}

function epgstation_install() {
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
    cp $CURRENT/conf/config.yml config/config.yml
    cp -r mirakurun-epgstation-install/bin/ .
echo "EPGStation config copy done!"
echo "EPGStation start"
sudo pm2 start dist/index.js --name "epgstation"
sudo pm2 save
}

# Mirakurun install
echo "Mirakurun install start!"
mirakurun_install
mirakurun_setup
echo "Mirakurun install done!"

# EPGStation install
echo "EPGStation install start!"
epgstation_install
echo "EPGStation install done!"
