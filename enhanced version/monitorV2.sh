#!/bin/bash

while true; do
  echo "Current time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "System uptime: $(uptime)"
  echo "Free disk space: $(df -h / | awk 'NR==2 {print $4}')"
  echo "Free memory: $(free -m | awk 'NR==2 {print $4}')"
  echo "Load average: $(cat /proc/loadavg | awk '{print $1,$2,$3}')"
  echo "-----------------------------------------------"
  
  # Check if any processes are using too much CPU or memory
  if [[ $(ps -eo pid,%cpu,%mem,cmd | sort -k 3 -r | head -n 5 | grep -v PID) ]]; then
    echo "Top CPU and memory consuming processes:"
    ps -eo pid,%cpu,%mem,cmd | sort -k 3 -r | head -n 5 | grep -v PID
  fi
  
  # Check network connectivity by pinging Google's DNS server
  if ping -c 1 8.8.8.8 >/dev/null; then
    echo "Network connection is up"
  else
    echo "Network connection is down"
  fi
  
  echo "-----------------------------------------------"
  sleep 5
done
