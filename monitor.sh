#!/bin/bash

while true; do
  echo "Current time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "System uptime: $(uptime)"
  echo "Free disk space: $(df -h / | awk 'NR==2 {print $4}')"
  echo "Free memory: $(free -m | awk 'NR==2 {print $4}')"
  echo "Load average: $(cat /proc/loadavg | awk '{print $1,$2,$3}')"
  echo "-----------------------------------------------"
  sleep 5
done
