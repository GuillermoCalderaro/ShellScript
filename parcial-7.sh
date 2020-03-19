#!/bin/bash

# COnsigna: Escriba un script que reciba una cantidad indeterminada de parametros (usted no los conoce)
# y que informe en pantalla dicha cantidad. Ademas este script debe imprimir cada uno de estos parametros
# y al final informar el nombre del script. Ademas cause la terminacion del script indicando que
# tuvo exito.

echo El numero de parametros es: $#
echo Los parametros ingresados son:
echo "  $@"
echo El nombre del script es: $0
exit 0
