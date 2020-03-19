#!/bin/bash
# este escript imprime los numeros del 1 al 100 y sus cuadrados por stdout
#

for VAR in $(seq 100)
do
	echo "Soy el $VAR y si me elevas al cuadrado obtendras " $(( VAR*VAR ))
done
