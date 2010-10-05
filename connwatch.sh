#!/bin/sh /etc/rc.common
# connwatch.sh

START=48

start() {
    logger -t connwatch "Starting connwatchd..."
    /bin/connwatchd.sh &
}

stop() {
    logger -t connwatch "Stopping connwatchd..."
    killall connwatchd.sh
}

boot() {
    logger -t connwatch "First login on boot time..."
    /bin/uni-mainz-login.sh login > /dev/null
    
    logger -t connwatch "Setting current time..."
    . /etc/hotplug.d/iface/40-rdate
    sync_rdate
    
    logger -t connwatch "Starting connwatchd..."
    /bin/connwatchd.sh &
}
