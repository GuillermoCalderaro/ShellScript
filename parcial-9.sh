#!/bin/bash

# Consigna: Realice un script que verifique cada 5 segundos si el rpoceso apache se esta ejecutando en el sistema.
# El script debe correr indefinidamente hasta que verifique que en 10 ocasiones ha encontrado el proceso 
# apache corriendo, lo cual debe causar la terminacion del proceso, informar dicha accion en pantalla y 
# posteriormente causar la terminacion del script con condicion de retorno 50.

COUNT=10

while [ $COUNT -ne 0 ]
do
	VAR=$(ps -a | grep apache | wc -l)
	if [ $VAR -ne 0 ]; then
		((COUNT-=1))
	fi
	sleep 5
	echo $COUNT
done
echo Matando proceso apache...
killall apache
exit 50
