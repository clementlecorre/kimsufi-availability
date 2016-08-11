#!/bin/bash
echo "Initializing..."
while true
do
  echo "Check started... $(date)"
  ./kimsufi_dispo.sh $SERVER_WARN $ZONE
  sleep 30
done
