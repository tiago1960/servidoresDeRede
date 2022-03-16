#!/bin/bash

#Objetivos:
#1 - Hora com minutos da coleta de dados
#2 - Nome da máquina
#3 - Total de memória RAM usada
#4 - Total de memória RAM disponível
#5 - O nome do processo que utiliza mais memória e o total de memória RAM utilizada
#6 - A listagem das partições contendo ponto de ponto de montagem, tamanho e percentagem de utilização
#7 - O total de bytes e pacotes enviados e recebidos em cada interface de rede

#LOG PURO TXT
#1
DATE_NOW=$(date --iso-8601=s)
$(echo $DATE_NOW >> 'logs_file.txt')

#2
$(echo $(hostname) >> 'logs_file.txt')

#3
MEM_USED=$(free -h | grep Mem | awk '{print $3}')
$(echo $MEM_USED >> 'logs_file.txt')

#4
MEM_FREE=$(free -h | grep Mem | awk '{print $7}')
$(echo $MEM_FREE >> 'logs_file.txt')

#5
MAX_PROC=$(ps -o pid,%mem,comm ax | sort -b -k2 | tail -n 2 | awk 'FNR == 1 {print $3, $2}')
$(echo $MAX_PROC >> 'logs_file.txt')

#6
LIST_PART=$(df -h | grep -v 'loop' | awk 'NR>1 {print $6, $2, $5}')
$(echo $LIST_PART >> 'logs_file.txt')

#7
LIST_NET=$(cat /proc/net/dev | awk 'NR>2 {print $1, $2, $3, $10, $11}')
$(echo $LIST_NET>> 'logs_file.txt')


#LOG HTML
$(echo " <div class="m-5">" >> 'logs_html.txt')
$(echo "    <div class="card-header"> <b>@$(hostname)</b> </div>" >> 'logs_html.txt')
$(echo " <ul class="list-group list-group-flush"> " >> 'logs_html.txt')
$(echo "        <li class="list-group-item"><b>Hora com minutos da coleta de dados(ISO8601):</b> $DATE_NOW </li>" >> 'logs_html.txt')
$(echo "        <li class="list-group-item"><b>Nome da máquina:</b> $(hostname) </li>" >> 'logs_html.txt')
$(echo "        <li class="list-group-item"><b>Total de memória RAM usada:</b> $MEM_USED </li>" >> 'logs_html.txt')
$(echo "        <li class="list-group-item"><b>Total de memória RAM disponível:</b> $MEM_FREE </li>" >> 'logs_html.txt')
$(echo "        <li class="list-group-item"><b>O nome do processo que utiliza mais memória e o total de memória RAM utilizada:</b> $MAX_PROC </li>" >> 'logs_html.txt')
$(echo "        <li class="list-group-item"><b>A listagem das partições contendo ponto de ponto de montagem, tamanho e percentagem de utilização:</b> $LIST_PART </li>" >> 'logs_html.txt')
$(echo "        <li class="list-group-item"><b>O total de bytes e pacotes enviados e recebidos em cada interface de rede:</b> $LIST_NET </li>" >> 'logs_html.txt')
$(echo '    </ul>' >> 'logs_html.txt')
$(echo '    </div>' >> 'logs_html.txt')