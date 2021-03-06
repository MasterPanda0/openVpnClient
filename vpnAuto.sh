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
		sudo -S openvpn --config ../config.ovpn
		sleep 6
	fi
	sleep 6
done
