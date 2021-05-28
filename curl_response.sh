#!/bin/bash

LISTS=$1 
if [[ ! -f ${LISTS} ]]; then
        echo "ERROR: ${LISTS} not found"
        echo "usage: bash $0 list.txt"
        exit
fi
for SITE in $(cat $LISTS);
do
    sleep 5
    HTTP_CODE=$(curl --connect-timeout 5 --max-time 5 -kLs $SITE --write-out "%{http_code}\n"  --silent)
    echo "$SITE  --> $HTTP_CODE"
    
done

