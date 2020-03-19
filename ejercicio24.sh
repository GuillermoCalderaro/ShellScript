#!/bin/bash

#este script suma los elementos de cada posicion de dos vectores cuyo tamaño se desconoce
# e imprime el resultado en pantalla.

VECTOR1=( 1 80 65 35 2 )
VECTOR2=( 5 98 3 41 8 )

for ((i=0 ; i < ${#VECTOR1[@]} ; i++  ))
do
	printf "%b" "La suma de los elementos de la posicion $i de los vectores es $((${VECTOR1[$i]} + ${VECTOR2[$i]}))\n"
done
