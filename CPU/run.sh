#/bin/bash

set -x
set -e


if [ "$(whoami)" != "root" ]; then 
	echo "Must be runned as root !!! Fuck off !!"
	exit 666
fi



echo "Stop last test-script.sh"
systemctl stop test-script.unit && sleep 10 || :


echo "Copy File test-script.sh to /tmp"
cp test-script.sh /tmp


echo "Copy systemd.service file to /etc/systemd/system"
cp test-script.service /etc/systemd/system/


echo "Reload systemd config"
systemctl daemon-reload 


echo "Start test-script.sh"
systemctl start test-script.service


echo "Status test-script.sh"
systemctl status test-script.service
