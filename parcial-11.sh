#! /bin/bash

# COnsigna:  Escriba un script que reciba como parametro el nombre de un grupo, cree el mismo y 
# agregue dicho grupo a cada usuario del sistema.

if [ $# -ne 1 ]; then
	printf "%b" "Error debe ingresar solo un parametro\n" >&2
	exit 1
fi

sudo groupadd $1

usuarios=($(cat /etc/passwd | cut -d: -f1))
echo $usuarios


for ((i=0; i< ${#usuarios[*]}; i++))
do
	echo Agregando ${usuarios[$i]} a grupo $1...
	usermod -g $1 ${usuarios[$i]}
	sleep 2
done

