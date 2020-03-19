#!/bin/bash

# Consigna: realice un programa que mueva todos los programas del directorio actual (archivos ejecutables) 
# hacia el subdirectorio /bin/ del directorio HOME del usuario actualmente logueado. El script debe imprimir
# en pantalla los nombres de los que mueve, indicar cuantos a movido o que no ha movido ninguno. Si el
# directorio /bin/ no existe debera ser creado.

if [ ! -e ~/bin/ ] ; then
       mkdir ~/bin/	
fi

ejec=($(find .))
count=0

for ((i=0; i < ${#ejec[*]}; i++))
do
	if [ -x ${ejec[$i]} ];then
		echo Moviendo ${ejec[$i]}...
		mv -i ${ejec[$i]} ~/bin/ 
		let count+=1
	fi
done
echo Se movieron $count archivos ejecutables del directorio actual a ~/bin

