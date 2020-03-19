#!/bin/bash
#este script le presenta al usuario una lista de tres opciones: Listar, DondeEstoy y QuienEsta
# el usuario seleccciona una y se ejecuta la accion.
#

select VAR in Listar DondeEstoy QuienEsta
do
    echo Procesando...
    if [ ! $VAR ]
    then 
	    echo Opcion Invalida. Por favor seleccione otra opcion.
    else	    
    	if [ $VAR == 'Listar' ]
    	then
        	echo -e "Usted selecciono la opcion 1.\nMostrando el contenido del directorio actual"
		echo $(ls)
		break
    	elif [ $VAR == 'DondeEstoy' ]
    	then
     	   echo -e "Usted selecciono la opcion 2.\nMostrando directorio actual"
	   echo $(pwd)
	   break
    	elif [ $VAR == 'QuienEsta' ]
    	then
        	echo -e "Usted selecciono la opcion 3.\nMostrando los usuarios conectados"
		echo $(users)
		break
	fi
    fi
done	
