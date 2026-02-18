#!/bin/bash

URL="http://localhost:80"
LOG_FILE="health_check.log"

DATE=$(date '+%Y-%m-%d %H:%M:%S')

STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$STATUS" -eq 200 ]; then
    echo "$DATE - OK - Status: $STATUS" >> $LOG_FILE
    exit 0
else
    echo "$DATE - ERROR - Status: $STATUS" >> $LOG_FILE
    exit 1
fi
