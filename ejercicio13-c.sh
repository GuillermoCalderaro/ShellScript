#!/bin/bash
# este script informa si el parametro que recibe se corresponde a un archivo existente o no.
# En caso de existir indica si es un directorio o un archivo.
# En caso de que no exista, crea un directorio con el nombre recibido como parametro
#

#verifico si la cantidad de argumentos ingresados es <> de 1. En cuyo caso salgo con un error
if (($#!=1))
then
    printf "%b" "Numero de parametros ingresado incorrecto.\n" >&2
    printf "%b" "Uso: ./ejercicio13-c.sh nombreDeArchivo.\n" >&2
    exit 1
else
    if [ -e "$1" ]      # verifico si el parametro pasado se corresponde a un archivo existente
    then
        if [ -d "$1" ];	then
	    echo "$1" existe y es un directorio
	elif [ -f "$1" ]; then
	    echo "$1" existe y es un archivo
	fi
    else
	echo "$1" No existe.
	echo Creando directorio...
	mkdir "$1"
    fi
fi
