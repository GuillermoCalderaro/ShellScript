#! /bin/bash

# Consigna: Realice un script que implemente a traves de la utilzacion basica de funciones las operaciones 
# basicas sobre arreglos:
#	- inicializar: crea un arreglo llamado array vacio
#	- agregar_elemento <parametro>: agregar al final del arreglo el elemento recibido como parametro
#	- eliminar_elemento: <parametro>: elimina el elemento en la posicion recibida como parametro
#		Debe validar que se reciba una posicion valida.
#	- longitud: imprime la longitud del arreglo en pantalla
#	- imprimir: imprime todos los elementos del arreglo en pantalla
#	- inicializarConValores <parametro1> <parametro2>: crea un arreglo con conlitud <parametro1> y
#		en todas las posiciones asigna el valor <parametro2>

function inicializar
{
	ARRAY=()
}

function agregar_elemento
{
	ARRAY[((${#ARRAY[*]} + 1))]=$1
}

function longitud
{
	echo La longitud del arreglo es: ${#ARRAY[*]}
}

function imprimir
{
	echo los elementos del array son: ${ARRAY[@]}
}

function eliminar_elemento
{
	read -p "Ingrese la posicion del elemento que desea eliminar: " POSICION
	if [ $POSICION -gt ${#ARRAY[*]} ]; then
		printf "%b" "La posicion ingresada era invalida\n" >&2
	else
		echo Se eliminara el elemento ${ARRAY[$POSICION]} en la posicion $POSICION
		unset ARRAY[$POSICION]
	fi
}

function inicializarConValores
{
	inicializar
	for ((i=0;i<$1;i++))
	do
		ARRAY[$i]=$2
	done
}

VAR="inicializar agregar_elemento eliminar_elemento longitud imprimir inicializarConValores salir"

echo "Seleccione alguna de las opciones: "
select OPT in $VAR
do
	case $OPT in
		"inicializar") echo seleccciono la opcion 1
			inicializar
			echo Se creo un nuevo arreglo con ${#ARRAY[*]} elementos
			;;
		"agregar_elemento") echo selecciono la opcion 2
				read -p "Ingrese el valor que desea ingresar: " VALOR
				agregar_elemento $VALOR
			;;
		"eliminar_elemento") echo selecciono la opcion 3
			eliminar_elemento
			;;
		"longitud") echo selecciono la opcion 4
			longitud
			;;
		"imprimir") echo selecciono la opcion 5
			imprimir
			;;
		"inicializarConValores") echo selecciono la opcion 6		
			read -p "Ingrese la cantidad de elementos a incluir seguido del valor de los mismos: " VAR1 VAR2
			inicializarConValores $VAR1 $VAR2
			;;
		"salir") echo Saliendo...
			exit 0
			;;
		*) echo opcion invalida. Por favor seleccione nuevamente
			;;
	esac
done
