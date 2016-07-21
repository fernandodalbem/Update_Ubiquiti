#!/bin/bash

cat /home/rafael/report_user.txt | while read ip ; do
    host=$(echo $ip | awk '{ print $1 }')
    user=$(echo $ip | awk '{ print $2 }')
    pass=$(echo $ip | awk '{ print $3 }')
    sshpass -p $pass ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null $user@$host "trigger_url https://github.com/fernandodalbem/Update_Ubiquiti/blob/master/Update_Ports.sh | sh; reboot" &
    sleep 0.15
done
