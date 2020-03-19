#!/bin/bash

# Consigna: Escriba un script que reciba dos nombres de directorios como parametro. Debera validar que se reciban 2
# y ademas que el primer parametro sea un directorio existente. El script debera copiar todos los archivos del primer directorio
# al directorio del segundo (recibido como segundo parametro), para los cuales el usuario tenga permiso de lectura
# (no debiendo validar subdirectorios en caso de que existieran). En el caso de que el directorio destino no exista debera crearlo.

if [ $# -ne 2 ]; then
	printf "%b" "Error. Numero invalido de argumentos\n" >&2
	exit 1
elif [ ! -d $1 ]; then 
	printf "%b" "Error. El primer parametro no se corresponde con un directorio existente.\n" >&2
	exit 2
fi

if [ ! -d $2 ];then
	echo $2 no se corresponde con un directorio existente.
	echo Creando $2...
	mkdir $2
fi

var=($(ls))


for ((i=0; i<${#var[*]}; i++))
do
	if [ -r ${var[$i]} ]; then
		echo Copiando ${var[$i]} desde $1 hacia $2...
		cp ${var[$i]} $1 $2
	fi

done

