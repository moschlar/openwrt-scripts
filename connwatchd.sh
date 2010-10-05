#!/bin/sh
# 
# This script checks the online connection every $waittime seconds
# with a ping to $targetpingdevice and attempts to re-login if 
# ping fails
#
# Dependency: uni-mainz-login.sh
#

targetpingdevice=134.93.178.2   #uni-mainz.de   # insert IP or hostname for ping target
waittime=30                     # insert time to wait between checks here

let counter=0

while true; do
    ping -c 1 $targetpingdevice > /dev/null
    if [ $? -eq 1 ]; then
        if [ $counter -gt 5 ]; then
            logger -t connwatchd "Waiting for ${waittime} seconds."
            sleep $waittime
        fi
        let counter=counter+1
        logger -t connwatchd "Internet connection lost! Reconnection attempt ${counter}..."
        # login again
        /bin/uni-mainz-login.sh login > /dev/null
        continue
    fi
    let counter=0
    sleep $waittime
done;
