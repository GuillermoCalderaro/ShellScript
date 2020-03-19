#!/bin/bash

# Consigna: Realice un script que reciba como parametro el nombre de un directorio. Debera validar 
# que el mismo existe y de no existir causar la terminacion del script con codigo de errror 4. 
# Si el directorio existe debera contar por separado la cantidad de archivos que en el se encuentran
# para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura e informar
# dichos valores en pantalla. En caso de encontrar subdirectorios no deberan procesarse y tampoco 
# deberan ser tenidos en cuenta para la suma a informar.

if [ $# -ne 1 ]; then
	printf "%b" "La cantidad de argumentos ingresados es invalida\n" >&2
	exit 3
elif [ ! -d $1 ]; then
        printf "%b" "El parametro ingresado no se corresponde con un directorio existente\n" >&2
	exit 4
else
	VAR=$(ls)
	ESC=0
	LECT=0
	for OPT in $VAR		# tb directamente in $(ls)
	do
		if [ -w $OPT ]; then
			((ESC+=1))
		fi
		if [ -r $OPT ]; then
			((LECT+=1))
		fi
	done

	echo La cantidad de archivos para los cuales el usuario $(whoami) tiene permisos de  lectura es: $LECT
	echo La cantidad de archivos para los cuales el usuario $(whoami) tiene permisos de escritura es: $ESC
	exit 0
fi
