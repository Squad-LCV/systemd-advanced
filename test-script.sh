#!/bin/bash


LOGFILE=/tmp/$(basename $0).log
function _print () {
	echo "${@}" | sed "s/^/$(date) - /" | tee -a $LOGFILE
}


while : ; do
	
	_print "It's Working !"
	_print "MEM : $(cat /proc/meminfo | grep "^MemAvailable")"
	_print "CPU : $(cat /proc/cpuinfo | grep "^processor")"
	_print "FS : $(ls -l)"
	_print "NET : $(ip -4 a)"
	echo -e "\n\n\n"

	sleep 10
done


