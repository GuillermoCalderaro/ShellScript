#!/bin/bash

#este script toma todos los elementos del arreglo al inicio del mismo y los multiplica. 
#informa el resultado por stdout

# si intentase retornar $AUX de la funcion no arrojaria el valor esperado ya que el valor de return posibvle solo
#puede oscilar entre 0 y 255

#Otra alternativa sera modificar una variable global e imprimir su valor luego de invocar a la funcion
NUM=( 10 3 5 7 9 3 5 4 )

function productoria
{
    AUX=1
    for ((i=0; i < ${#NUM[@]} ; i++))
    do
	((AUX*=${NUM[$i]}))
    done
    printf "%b" "El producto de todos los elementos del vector es: $AUX\n" 
}

productoria
exit 0
