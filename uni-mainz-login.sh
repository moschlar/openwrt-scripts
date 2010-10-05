#!/bin/sh
#
# This script provides login- and logout-functionality
# for the network in the Johannes-Gutenberg-University Mainz.
# 
# Dependency: curl with ssl-support
#

USER=           # Insert ZDV-Username here
PASSWORD=       # Insert corresponding Password here

login() {
    logger -t uni-mainz-login "Logging in..."
    curl -s --data-urlencode user=$USER --data-urlencode pass=$PASSWORD -d "submit=+++Login+++&forward=&s=" -e https://login.uni-mainz.de/login.html -k https://login.uni-mainz.de/cgi-bin/login-cgi > /dev/null
    #Uncomment the following line to get verbose output
    #curl -v --data-urlencode user=$USER --data-urlencode pass=$PASSWORD -d "submit=+++Login+++&forward=&s=" -e https://login.uni-mainz.de/login.html -k https://login.uni-mainz.de/cgi-bin/login-cgi
}

logout() {
    logger -t uni-mainz-login "Logging out..."
    curl -s --data-urlencode 'command=logout' -k https://login.uni-mainz.de/cgi-bin/logout.cgi > /dev/null
    #Uncomment the following line to get verbose output
    #curl -v --data-urlencode 'command=logout' -k https://login.uni-mainz.de/cgi-bin/logout.cgi
}

case $1 in
    reconnect) logout; login;;
    logout) logout;;
    login) login;;
    *) echo "Usage: ./uni-mainz-login.sh login|logout|reconnect ";;
esac
