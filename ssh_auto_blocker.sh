#!/bin/bash

LOG_FILE="/var/log/auth.log"
THRESHOLD=5
BLOCK_LOG="/home/ugoo/blocked_ips.log"

echo "SSH Auto-Blocker Running..."
echo "Threshold set to $THRESHOLD failed attempts"
echo "------------------------------------------"

while true
do
    clear
    echo "Auto-Block Monitor - $(date "+%Y-%m-%d %H:%M:%S")"
    echo "------------------------------------------"

    grep "Failed password" $LOG_FILE | \
    awk '{for(i=1;i<=NF;i++) if($i=="from") print $(i+1)}' | \
    sort | uniq -c | while read count ip
     
    do
         echo "$count $ip"
     if      [ "$count" -ge "$THRESHOLD" ] && [ "$ip" != "127.0.0.1" ]; then
        if ! sudo iptables -L INPUT  -n | grep -w "$ip" > /dev/null/ 2>&1; then
             sudo iptables -A INPUT -s "$ip" -p tcp --dport 22 -j DROP

             BLOCK_MESSAGE="[$(date "+%Y-%m-%d %H:%M:%S")] BLOCKED: $ip - $count failed attempts"

             echo "$BLOCK_MESSAGE"
             echo "$BLOCK_MESSAGE" | tee -a "$BLOCK_LOG" > /dev/null
        fi
    fi
 done

  sleep 10
done
