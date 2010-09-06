#!/bin/sh
# 
# This script checks the online connection every $waittime seconds
# with a ping to $targetpingdevice and attempts to re-login if 
# ping fails
#
# Dependency: uni-mainz-login.sh
#

targetpingdevice=heise.de	# insert IP or hostname for ping target
waittime=30					# insert time to wait between checks here

while true; do
    ping -c 1 $targetpingdevice > /dev/null
    if [ $? == 1 ]; then
		logger "Internet connection lost! Reconnecting..."
        # login again
		/sbin/uni-mainz-login.sh login > /dev/null
		continue
    fi
    sleep $waittime
done;
