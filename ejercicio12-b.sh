#!/bin/bash
# este script realiza las mismas operaciones que el titulado ejercicio12-a.sh solo que
# en este se deben ingresar los valores como parametros.
# en este caso se verifcia que el numero de parametros inresados sea el correcto antes de proseguir
#TODO quedaria pendiente la verificacion de que los parametros ingresados sean numeros.

if (($#<2))
then 
	printf  "%b" "Numero insuficiente de parametros\n" >&2
	printf "%b" "Uso: ./ejercicio12-b.sh arg1 arg2\n" >&2
elif (($#>2))
then
	printf  "%b" "Numero excesivo de parametros\n" >&2
	printf "%b" "Uso: ./ejercicio12-b.sh arg1 arg2\n" >&2
else
	printf "%b" "Cantidad de parametros correcta. Procesando... \n" 	
echo "Los parametros ingresados son: $1 y $2"
echo "************************************"
echo "El resultado de la suma de ambos numeros es: $(( $1 + $2 ))"
echo "El resultado de la resta de ambos numeros es: $(( $1 - $2 ))"
echo "El resultado de la multiplicacion de ambos numeros es: $(( $1 * $2 ))"
if (($1 > $2))
then
	echo $1 es mayor que $2
elif (( $1 < $2))
then 
	echo $2 es mayor que $1
else
	echo Ambos numeros son iguales
fi

fi
	



