#!/bin/bash


# Configurações
PORT=80
URL="http://localhost:$PORT"
LOG_FILE="health_check.log"
SERVICE="apache2"

DATE=$(date '+%Y-%m-%d %H:%M:%S')

MAX_RETRIES=3
RETRY_DELAY=2


# Verificar serviço
SERVICE_STATUS=$(systemctl is-active $SERVICE)


# Verificar porta
PORT_STATUS=$(ss -tunl | grep "$PORT" )


# Verificar HTTP com retry
ATTEMPT=1
HTTP_CODE="000"

while [ $ATTEMPT -le $MAX_RETRIES ]; do

    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

    if [ "$HTTP_CODE" -eq 200 ]; then
	break
    fi

    sleep $RETRY_DELAY
    ATTEMPT=$((ATTEMPT+1))

done


# Verificar status final
if [ "$SERVICE_STATUS" = "active" ] && [ "$HTTP_CODE" -eq 200 ] && [ -n "$PORT_STATUS" ]; then
    STATUS="OK"
    EXIT_CODE=0
else
    STATUS="ERROR"
    EXIT_CODE=1
fi

echo "[$DATE] [SERVICE:$SERVICE] [STATUS:$STATUS] [PORT:$PORT] [HTTP:$HTTP_CODE]" >> $LOG_FILE

exit $EXIT_CODE
