#!/bin/bash

#este script verifica si los parametros recibidos que se hallan en posiciones impares se corresponden o no 
#con archivos o directorios existentes o no en el sistama

VAR=1
for FN in "$@"
do
    if ((VAR % 2 == 0));then
    	echo $FN
    fi
    ((VAR+=1))
    echo $VAR
done















#for ((i = 1; i < 10; i+=2))
#do
#    echo $i
#done
