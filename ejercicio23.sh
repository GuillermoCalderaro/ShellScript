#!/bin/bash

#este script recorre un arreglo de numeros e imprime en pantalla los numero pares y cuenta los 
#impares informando dicho resultado al final del recorrido

VECTOR=( 2 5 4 13 17 9 8 60 )
CONT_IMP=0

printf "%b" "Numeros pares:\n"
for (( i=0 ; i< ${#VECTOR[@]} ; i ++))
do
    if ((${VECTOR[$i]} % 2 == 0)) ; then
        printf "%b" "\tNumero: ${VECTOR[$i]} en posicion $i \n"
    else
        ((CONT_IMP++))         #alternativamente let CONT_IMP+=1
fi
done

printf "%b" "Cantidad de numeros impares en el vector: $CONT_IMP\n"
