#!/bin/bash

TIMEOUT=10
# Telegram bot User info bot Python
# search bot @myidbot
ID=0
TOKEN=0


function usage()
{
    echo "TelBot Sender"
    echo ""
    echo "get id user with @myidbot"
    echo "get token with @botfather"
    echo ""
    echo -e "$0"
    echo -e "\t-h --help"
    echo -e "\t--token=$TOKEN"
    echo -e "\t--id=$ID"
    echo -e "\t--text=$TEXT"
    echo ""
}

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --token)
            TOKEN=$VALUE
            ;;
        --id)
            USERID=$VALUE
            ;;
        --text)
            TEXT=$VALUE
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl --data-urlencode -s --max-time $TIMEOUT -d "chat_id=$USERID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
echo "Send $TEXT to $USERID"
