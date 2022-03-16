#!/bin/bash

#Verifica se existe o arquivo logs_file.txt
if [ ! -f 'logs_file.txt' ];
    then
        $(touch logs_file.txt)
fi
