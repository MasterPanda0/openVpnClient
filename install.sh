$!/bin/bash

Activity="`pwd`/vpnAuto.sh > `pwd`/vpnAuto.log 2>&1"
Job="@reboot sleep 60 && $Activity"

(crontab -l | grep -v -F "$Activity"; echo "$Job") | crontab -
ehco "Instalation finished! please restart your system"