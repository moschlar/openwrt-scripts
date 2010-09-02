#!/bin/sh
#
# This script provides general logging codes for the
# Buffalo WZR-HP-G300NH Wireless-N-Gigabit-Router
# running OpenWRT Backfire 10.03.
#

#logger "BUTTON=$BUTTON ACTION=$ACTION SEEN=$SEEN"

case $BUTTON in 
	BTN_0) 
	# reset
		logger "reset $ACTION"
	;; 
	BTN_1) 
	# aoss
		logger "aoss $ACTION"
	;; 
	BTN_2) 
	# usb
		logger "usb $ACTION"
	;; 
	BTN_3) 
	# qos_on
		logger "qos_on $ACTION"
	;; 
	BTN_4) 
	# qos_off
		logger "qos_off $ACTION"
	;; 
	BTN_5) 
	# router_off
		logger "router_off $ACTION"
	;; 
	BTN_6) 
	#router_auto
		logger "router_auto $ACTION"
	;; 
	*) 
	#else
		logger "unknown button  $ACTION"
	;; 
esac 
