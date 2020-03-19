#!/bin/bash
# este script verifica cada 10 segundos si el usuario pasado como parametro se ha logeado en el sistema

#verifico si la cantidad de parametros ingresada es la correcta

if [ $# -ne 1 ]
then
    printf "%b" "Numero de parametros ingresado invalido\n" >&2
    exit 1
else 
    while true
    do
	VAR=$(users | grep -w "$1" | wc -l)
	if [ $VAR -eq 1 ];then
		break
	fi
        sleep 10
    done
    printf "%b" "Usuario $1 logueado en el sistema\n" 
    exit 0
fi
