#!/bin/bash
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
function getStatus () {
	ifconfig | grep $1 && return 1
	return 0
}

while [[ 1 ]]; do
	getStatus tun0
	if [[ $? == 0 ]]; then
		echo "openvpn is not connected!"
		echo "Reconnecting!"
                #Replace your_sudo_password to your real user sudo password.
		echo your_sudo_password | sudo -S openvpn --config /PATH_TO_CONFIGFILE/config.ovpn
		sleep 6
	fi
	sleep 6
done
