#!/bin/bash


URL="http://localhost:80"
LOG_FILE="health_check.log"
SERVICE="apache2"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Verificar serviço
SERVICE_STATUS=$(systemctl is-active $SERVICE)

# Verificar HTTP
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$SERVICE_STATUS" = "active" ] && [ "$HTTP_CODE" -eq 200 ]; then
    STATUS="OK"
    EXIT_CODE=0
else
    STATUS="ERROR"
    EXIT_CODE=1
fi

echo "[$DATE] [$SERVICE] [$STATUS] [HTTP: $HTTP_CODE]" >> $LOG_FILE

exit $EXIT_CODE
