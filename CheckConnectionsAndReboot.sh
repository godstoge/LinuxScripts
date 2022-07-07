#!/bin/bash

#
# Linux bash script that will reboot the server after checking if there is any current SSH-connections to the server using native tools (i.e. ss).
# Purpose: Reboot server if there is no data being transfered over the connections.
# https://github.com/godstoge/LinuxScripts/blob/main/CheckConnectionsAndReboot.sh

if  ss -t '( dport = :22 or sport = :22 )'
 then
  echo "Found current SSH-connections"; 
  # Get LastRcvd (in milliseconds) to the connections
  connections=$(ss -i '( sport = :ssh or sport = :ssh )' |  awk 'match($0, /last/) {print substr($0, RSTART)}' | awk -F ":" '{print $3" "$4}' | awk -F " " '{print $1}')
  
  # Iterate through the LastRcvd values to determine if any of them have been idle for more than 10 seconds
  # The assumption being that we have clients that are just idling with a keepalive, but most importantly: Are not transfering data to the SFTP-server.
  clearedForReboot=1 //yes
  for connection in $connections   
   do
    if [ $connection -lt 10000 ];
     then echo "Connection over 10 seconds: $connection";
    else 
     echo "Connection under 10 seconds: $connection";
     clearedForReboot=0
    fi
   done
  
  echo "Conclusion - server is clear for reboot (true/False): $clearedForReboot"
  if [ $clearedForReboot -eq 1 ]; then reboot;fi
fi
