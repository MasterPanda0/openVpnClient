#!/bin/bash

Activity="`pwd`/vpnAuto.sh > `pwd`/vpnAuto.log 2>&1"
Job="@reboot sleep 60 && $Activity"

sudo chmod +x vpnAuto.sh
sudo chmod +x uninstall.sh

(crontab -l | grep -v -F "$Activity"; echo "$Job") | crontab -
echo "Instalation finished! please restart your system"
