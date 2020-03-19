#!/bin/bash

# Consigna: Implemente un script que agrege a un arreglo todos los archivos del directorio /home
# cuya terminacion sea .doc. Adicionalmente implemente las siguientes funciones que permitan acceder a la estructura creada.
#	- verArchivo <nombre_de_archivo>: Imprime al archivo en pantalla si el mismo se encuentra en el arreglo. 
#		Caso contrario imprime el mensaje de error "Archivo no encontrado" y devuelve como valor de retorno 5.
#	- cantidadArchivos: Imprime la cantidad de archivos del /home con terminacion .doc
#	- borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archivo logicamente. 
#		Si el usuario responde Si, elimina el elemento solo del arreglo. Si el usuario responde No, 
#		elimina el archivo del arreglo y tambien del FileSystem. Debe validar que el archivo exista en el arreglo.
#		En caso de no existir, imprime el mensaje de error "Archivo no encontrado" y devuelve como valor
#		de retorno 10.


array=($(find /home -name *.doc))

opciones="verArchivos cantidadArchivos borrarArchivo"

function verArchivo
{
	for ((i=0; i<${#array[*]};i++))
	do
		if [ $1 = ${array[$i]} ]; then
			echo Archivo encontrado
			return 0
		fi
	done
	echo Archivo no encontrado
	return 5
}

function cantidadArchivos
{
	echo La cantidad de archivos con extension .doc en /home es: ${#array[*]}
}

function borrarArchivo
{
	for ((i=0; i<${#array[*]};i++))
	do
		if [ $1 = ${array[$i]} ]; then
			read -p "Desea eliminar el archivo solo del vector? [Si|No]: " RESP
			case $RESP in
				"Si") unset array[$i]
					return 0
					;;
				"No") unset array[$i]
					rm -i ${array[$i]}
					return 0
					;;
				*) echo Respuesta invalida

			esac
		fi
	done
	printf "%b" "No se hallo el archivo en /home\n" >&2
	return 10
}

echo seleccione alguna de las opciones presentadas a continuacion
select opt in $opciones
do
	case $opt in
		"verArchivos") 
			read -p "Ingrese el nombre del archivo que desea validar: " nombre
		       	verArchivo $nombre
			;;
		"cantidadArchivos") cantidadArchivos
			;;
		"borrarArchivo")
			read -p "Ingrese el nombre del archivo que desea borrar: " arch
			borrarArchivo $arch
			;;
		*)
			;;
	esac

done

return 0
