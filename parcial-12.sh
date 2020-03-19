#! /bin/bash

# Consigna: Realice un script que simule el comportamiento de una estructura de PILA e implemente las siguientes 
# funcionalidades aplicables sobre un aestructura global definida en el script




pila=(10 12 14)

function push
{
	pila[(${#pila[*]} + 1)]=$1
}

function pop
{
	unset pila[${#pila[*]}]
}

function length
{
	return ${#pila[*]}
}

function print
{
	echo Los elementos de la pila son:
	echo ${pila[@]}
}
print
read -p "Ingrese un valaor a agregar en la pila: " valor
push $valor

print
pop

print
length
echo La cantidad de elementos de la pila es: $? 
