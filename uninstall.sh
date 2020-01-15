#!/bin/bash

Activity="`pwd`/vpnAuto.sh > `pwd`/vpnAuto.log 2>&1"

(crontab -l | grep -v -F "$Activity") | crontab -
echo "Finished! please restart your system"
