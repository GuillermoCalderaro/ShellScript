#!/bin/bash

# consigna:  EScriba un script que reciba una cantidad desconocida de parametros al momento de su invocacion 
# (debiendo validar que al menos se reciba uno). Cada parametro representa la ruta absoluta o relativa de 
# un archivo o directorio en el sistema. El script debera iterar por todos  los parametros recibidos y, solo 
# para aquellos parametros que se hallan en posiciones impares (primero, tercero, etc) verificar si el archivo
# o directorio existen en el sistema, imprimiendo en pantalla que tipo de objeto es (archivo o directorio).
# Ademas debera informar la cantidad de archovos o directorios inexistentes en el sistema

if [ $# -eq 0 ]; then
	printf "%b" "Error. Se debe ingresar al menos un argumento\n" >&2
	exit 1
fi

VAR=$@
CONT=0
IND=1

for OPT in $VAR
do
	if [ -e $OPT ]; then
		if  (($IND%2 != 0)) ; then
			if [ -d $OPT ]; then
				printf "%b" "El parametro $OPT se corresponde con un directorio existente\n"
			else
				printf "%b" "El parametro $OPT se corresponde con un archivo existente\n"
			fi
		fi
	else
		((CONT+=1))
	fi
	((IND+=1))
done

	printf "Se ingresaron $CONT parametros que no se correspondian con ningun archivo o directorio existente en el sistema\n"
	exit 0
