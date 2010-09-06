#!/bin/sh /etc/rc.common
# 

START=60

start() {
	logger -t autoreconnect "Starting autoreconnect script..."
	/sbin/autoreconnect.sh &
}

stop() {
	logger -t autoreconnect "Stopping autoreconnect script..."
	killall autoreconnect.sh
}

boot() {
	# Login once on boot time
	logger -t autoreconnect "First login on boot time"
	/sbin/uni-mainz-login.sh login > /dev/null
	
	logger -t autoreconnect "Setting current time..."
	. /etc/hotplug.d/iface/40-rdate
	sync_rdate
	
	logger -t autoreconnect "Starting autoreconnect script..."
	/sbin/autoreconnect.sh &
}