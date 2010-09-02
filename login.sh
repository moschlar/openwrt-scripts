#!/bin/sh
#
# This script provides login- and logout-functionality
# for the network in the Johannes-Gutenberg-University Mainz.
# 
# Dependency: curl with ssl-support
#

USER=			# Insert ZDV-Username here
PASSWORD=		# Insert corresponding Password here

login() {
	curl -s --data-urlencode user=$USER --data-urlencode pass=$PASSWORD -d "submit=+++Login+++&forward=&s=" -e https://login.uni-mainz.de/login.html -k https://login.uni-mainz.de/cgi-bin/login-cgi
	#curl -v --data-urlencode user=$USER --data-urlencode pass=$PASSWORD -d "submit=+++Login+++&forward=&s=" -e https://login.uni-mainz.de/login.html -k https://login.uni-mainz.de/cgi-bin/login-cgi
}

logout() {
	curl -s --data-urlencode 'command=logout' -k https://login.uni-mainz.de/cgi-bin/logout.cgi
	#curl -v --data-urlencode 'command=logout' -k https://login.uni-mainz.de/cgi-bin/logout.cgi
}

case $1 in
	login) login;;
	logout) logout;;
	*) echo "command error" ; exit &
esac