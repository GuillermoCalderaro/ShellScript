#!/bin/bash

# Consigna: Realice un script que agregue a un arreglo los nombres de los archivos del directorio /etc 
# cuya terminacion sea .conf e implemente las siguientes funciones:
#	- cantidad: imprime la cantidad de archivos del /etc con terminacion .conf
#	- verArchivos: Imprime los nombres de todos los archivos del /etc con terminacion .conf
#	- existe: Recibe como primer parametro el nombre de un archivo con terminacion .conf e imprime
#		en pantalla si existe en el etc o no.
#	- eliminar: Recibe como primer parametro el nombre de un archivo con terminacion .conf y como segundo parametro
#		la cadena logico o fisico. Si el segundo parametro es logico solo borra la entrada en el arreglo; si es fisico
#		borra la entrada en el arreglo y en el FileSystem informando en cada caso la accion realizada.

ARR=($(sudo find /etc -name *.conf))

OPCIONES='cantidad verArchivos existe eliminar'

function cantidad 
{
	echo La cantidad de archivos en el /etc con terminacion .conf es de: ${#ARR[*]}
	return 0
}

function verArchivos
{
	echo Los archivos contenidos en /etc son: 
	echo ${ARR[@]}
	return 0
}

function existe
{
	for ((i=0; i < ${#ARR[*]} ; i++))
	do
		if [ $1 = ${ARR[$i]} ]; then
			echo El archivo $1 existe en el directorio /etc
			return 0
		fi		
	done
	echo El archivo $1 no existe en el directorio /etc
	return 0
}

function eliminar
{
	for ((i=0 ; i < ${#ARR[*]} ; i ++))
	do
		if [ $1 = ${ARR[$i]} ];then
			case $2 in
				"logico") echo Eliminando archivo del vector...
					unset ARR[$i]
					echo $1 fue eliminado.
					;;
				"fisico") echo Eliminando archivo del vector y del directorio /etc...
					unset ARR[$i]
					rm -i $1
					echo $1 fue eliminado del vector y del directorio.
					;;
			esac
		fi
	done
	echo  El archivo $1 no existe en el directorio /etc
	return 0
}

verArchivos
read -p "ingrese el nombre del parametro a buscar: " var1 var2
eliminar $var1 $var2
verArchivos
exit 0

