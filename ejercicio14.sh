#!/bin/bash

# este script agrega una cadena recibida como parametro al inicio o final de todos los archivos del directorio
# recibido como parametro
# 
#    Ejemplo de uso:
#Si tengo los siguientes archivos: /tmp/a /tmp/b
# Al ejecutar: ./renombra /tmp/ -a EJ
# Obtendré como resultado: /tmp/aEJ /tmp/bEJ
# Y si ejecuto: ./renombra /tmp/ -b EJ
# El resultado será: /tmp/EJa /tmp/EJb

opcionA="-a"
opcionB="-b"

function concatenarAdelante
{
    for FN in $(ls "$1")
        do
	    mv "$1/$FN" "$1/$2$FN"     #dentro de las funciones $2 no se refiere a la opcion sino al 2do parametro
	done
}


function concatenarAtras
{
    for FN in $(ls "$1")
        do
	    mv "$1/$FN" "$1/$FN$2"
	done
}


#antes de realizar la accion se llevan a cabo una serie de verificaciones

#se verifica si el numero de argumentos ingresados es el correcto
if [ $# -ne 3 ]
then
    printf "%b" "Cantidad de parametros invaldos\n" >&2
    exit 1
fi
#se verifica si el primer parametro se corresponde a un directorio existente

if [ ! -d "$1" ]
then
    printf "%b" "El directorio $1 no es un directorio existente\n" >&2
    exit 2
fi

#se verifica que la opcion ingresada sea correcta
if [  "$2" != $opcionA  -a "$2" != $opcionB ]
then
    printf "%b" "La opcion ingresada no es valida\n" >&2
    exit 3
fi
#se verifica que la longitud del string sea distinta de 0

if [ -z "$3" ]
then
    printf "%b" "La cadena ingresada para concatenar es vacia\n" >&2
    exit 4
fi

#el codigo que realiza la opcion viene a continuacion

if [ $2 = "$opcionA" ]
then
    printf "%b" "Se concatenara  $3 al final de todos los archivios del directorio $1\n"
    concatenarAtras $1 $3
else
    printf "%b" "Se concatenara  $3 al inicio de todos los archivios del directorio $1\n"
    concatenarAdelante $1 $3
fi



