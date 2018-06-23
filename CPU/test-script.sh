#!/bin/bash


LOGFILE=/tmp/$(basename $0).log
> $LOGFILE

function _print () {
	echo "${@}" | sed "s/^/$(date) - /" | tee -a $LOGFILE
}

function _clean () {
	rm -rf /tmp/temp
}

function test_cpu () {
	#generate CPU activity
	echo "Test CPU"
	stress-ng --cpu 1 --hdd 1 --fork 1 --vm 1 --switch 100 --timeout 120s 

}


trap '_print "SIGTERM received !" ; exit' TERM
trap '_clean' EXIT

while : ; do
	
	_print "It's Working !"
	test_cpu
	echo -e "\n\n\n"

	sleep 10
done


