#!/bin/bash

# este script despliega un menu de opciones para operar con una pila
# las funcionalidades que ofrece son : agregar elemento - sacar elemento - 
#consultar la cantidad de elementos de la pila - imprimir la totalidad de elementos de la pila
#

LISTA_DE_OPC='Agregar Sacar Cantidad ImprimirTodo'

function Agregar 
{
	echo "Seleccciono la opcion agregar"
}

function Sacar
{
	echo "Selecciono la opcion Sacar"
}

function Cantidad
{
	echo "Selecciono la opcion Cantidad"
}

function ImprimirTodo
{
	echo "Selecciono la opcion ImprimirTodo"
}

select VAR in $LISTA_DE_OPC
do
    if [ $VAR ]; then
	$VAR
    else
	echo "Opcion invalida. Por favor seleccione nuevamente."
    fi	
done

