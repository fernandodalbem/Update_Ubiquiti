#!/bin/bash

cat /home/rafael/ip_list.txt | while read ip ; do
  host=$(nmap -p22 $ip -oG - | grep 22/open | awk '{ print $2 }')
    if [ -z "$host" ]
      then
        echo "$ip" >> Atualizado.txt
      else
        echo "$ip" >> PrecisaAtualizar.txt
        for IP in `cat PrecisaAtualizar.txt | grep -v framed`; do
        	  sshpass -p n0dr1v1ng ssh -p22 -oConnectTimeout=10 -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null admin@$IP "trigger_url https://github.com/fernandodalbem/Update_Ubiquiti/blob/master/Update_Ports.sh | sh; reboot" &
            sleep 0.15
        done
    fi
done
