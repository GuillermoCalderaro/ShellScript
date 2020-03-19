#!/bin/bash
# este script solicita al usuario el ingreso de 2 numeros por stdin
# luego realiza un par de operaciones y comparaciones entre ellos 
# e informa el resultado por stdout

read -p "Ingrese un numero: " NUM1
read -p "Ingrese otro numero: " NUM2
echo "Gracias. Usted ingreso $NUM1 y $NUM2"
echo "************************************"
echo "El resultado de la suma de ambos numeros es: $(( NUM1 + NUM2 ))"
echo "El resultado de la resta de ambos numeros es: $(( NUM1 - NUM2 ))"
echo "El resultado de la multiplicacion de ambos numeros es: $(( NUM1 * NUM2 ))"
if ((NUM1 > NUM2))
then
	echo $NUM1 es mayor que $NUM2
elif (( NUM1 < NUM2))
then 
	echo $NUM2 es mayor que $NUM1
else
	echo Ambos numeros son iguales
fi
