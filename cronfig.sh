#!/bin/bash

PATHJOY=$(pwd)
crontab -l > cron_aux
echo "*/2 * * * * /bin/bash ${PATHJOY}/main.sh >> ${PATHJOY}/cronput.joy 2>&1" > cron_aux
echo "config cron job"
crontab cron_aux
echo "Cron finalizado"
rm cron_aux
echo "cron_aux removido"