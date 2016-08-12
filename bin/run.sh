#!/bin/bash
welcome="Hi, starting search for OVH references and zone availabilities for $SERVER_WARN every ${TIMESLEEP}s ...%0A%0A"
notify=1
timeout=1
#time of curl ~ /3
TIMERENOTIFY=$(($TIMERENOTIFY / 3))
echo "Initializing..."
./bot.sh --token=$TOKEN --id=$USERID --text="$welcome"
while true
do
  echo "Check started... $(date)"
  result=`./kimsufi_dispo.sh $SERVER_WARN $ZONE`
  notify=$?
  if [ $notify = 1 ]; then
    if [ $timeout = 1 ]; then
        echo "NOTIFY"
        ./bot.sh --token=$TOKEN --id=$USERID --text="$result"
        timeout=0
    else
      if [ "$timeout" -gt "$TIMERENOTIFY" ] ; then
          timeout=1
      else
          timeout=$(($timeout + $TIMESLEEP))
          echo "wait notify.. (${timeout}s of ${TIMERENOTIFY}s)"
      fi
    fi
  fi
  sleep $TIMESLEEP
done
