#/bin/bash

set -x
set -e


if [ "$(whoami)" != "root" ]; then 
	echo "Must be runned as root !!! Fuck off !!"
	exit 666
fi



echo "Stop last test-script.sh"
systemctl stop systemd.unit


echo "Copy File test-script.sh to /tmp"
cp test-script.sh /tmp


echo "Copy systemd.unit file to /etc/systemd/system"
cp test-script.unit /etc/systemd/system


echo "Reload systemd config"
systemctl daemon-reload 


echo "Start last test-script.sh"
systemctl start systemd.unit


echo "Status last test-script.sh"
systemctl status systemd.unit
