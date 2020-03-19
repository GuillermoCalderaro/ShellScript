#!/bin/bash

# Consigna: escriba un script que al momento de ser ejecutado pregunte al usuario que tipos 
# de archivos desea limpiar. El usuario debe introducion por teclado un patron de archivos, 
# como por ejemplo *.log o *pepe o cualquier otro tipo. El script debe vaciar todos los archivos 
# del sistema que concuerden con este patron, ademas de informar por pantalla el nombre del 
# archivo que esta borrando para cada uno de ellos

read -p "Ingrese el patron para vaciar los archivos que concuerdan con el: " PATRON
for OPT in $(find . -name "*$PATRON")
do
	echo Vaciando $OPT
	cat /dev/null > $OPT
done
