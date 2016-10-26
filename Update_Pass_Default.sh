#!/bin/bash

cat ip_list.txt | while read ip ; do
    host=$(echo $ip | awk '{ print $1 }')
    sshpass -p ubnt ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null ubnt@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p dr1v1ng ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null admin@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p n0dr1v1ng ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null admin@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p tsgbr ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null admin@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p tsg159 ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null admin@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p tlg%159 ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null admin@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p tlg159 ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null admin@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &  
    sshpass -p tsgbr ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null telgo@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p tsg159 ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null telgo@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p tlg%159 ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null telgo@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p tlg159 ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null telgo@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" & 
    sshpass -p fuck.er ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null mother@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p fucker ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null mother@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sshpass -p fuck.er ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null moth3r@$host "trigger_url https://raw.githubusercontent.com/fernandodalbem/Update_Ubiquiti/master/Update_Ports.sh | sh; reboot" &
    sleep 0.15
done
rm -rf ip_list.txt
