#!/bin/bash

DATA=$(curl https://ws.ovh.com/dedicated/r2/ws.dispatcher/getAvailability2)

echo "Searching for OVH references and zone availabilities for $SERVER_WARN..."
REFERENCES=$(echo $DATA | jq '.answer.availability[].reference' | grep "$SERVER_WARN")
for REFERENCE in $REFERENCES; do
    echo "REFERENCE: $REFERENCE"
    ZONES=$(echo $DATA | jq '.answer.availability[] | select(.reference == '$REFERENCE').zones[].zone' | grep "$ZONE")
    for ZONE in $ZONES; do
        echo "  - ZONE: $ZONE"
        AVAILABILITY=$(echo $DATA | jq '.answer.availability[] | select(.reference == '$REFERENCE').zones[] | select(.zone == '$ZONE').availability')
        echo "AVAILABILITY: $AVAILABILITY"
        if [[ "$AVAILABILITY" != "\"unknown\"" ]] && [[ "$AVAILABILITY" != "\"unavailable\"" ]]; then
            RESULTS="$RESULTS  - $REFERENCE $ZONE is available: ${AVAILABILITY}"$'%0A'
        fi
    done
done

if [[ $RESULTS == "" ]]; then
    echo "No Reference  zone available."
else
  RESULTS="References / zones available : "$'%0A'$RESULTS
  RESULTS=$(echo $RESULTS | sed s/\"/\'/g)
  #Send bot
  echo "Find $RESULTS"
  echo "Sending message to $USERID"
  ./bot.sh --token=$TOKEN --id=$USERID --text="$RESULTS"
  pkill run.sh
fi
