#!/bin/bash

TUNER1="tuners-Q3PE4"
TUNER2="tuners-W3PE4"
TUNER3="tuners-15ch"
PS3='Select tuners configuration yaml> '
CURRENT="$HOME/mirakurun-epgstation-install"
echo "Dir: $CURRENT"
echo "Mirakurun setup start!"

# Mirakurun setuo
# 1.Q3PE4 2.W3PE4 3.tuners-15ch
select TUNER in "$TUNER1" "$TUNER2" "$TUNER3" "exit"; do
    if [ $TUNER = exit ]; then
        break
    else
        echo $TUNER
        sudo rm /usr/local/etc/mirakurun/tuners.yml
        sudo cp ../conf/$TUNER.yml /usr/local/etc/mirakurun/
        sudo mv /usr/local/etc/mirakurun/$TUNER.yml /usr/local/etc/mirakurun/tuners.yml
        ls -lah /usr/local/etc/mirakurun/
        sudo mirakurun init
        sudo mirakurun restart
    fi
done
echo "Mirakurun install done!"
