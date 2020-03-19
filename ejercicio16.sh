#!/bin/bash

#este script recibe como parametro una extension y realiza un reporte de la cantidad de archivos
#con dicha extension que posee cada usuario 
# la informacion se almacena en report.txt

#se verifica que el numero de arhgumentos sea valido
if [ $# -ne 1 ]
then
    printf  "%b" "No se ingresaron la cantidad de parametros necesarios\n" >&2
    exit 1
else
    echo "Generando archivo..."
    for USUARIOS in $(cut -d":" -f1 /etc/passwd)
    do
        var=$( sudo find /home -user ${USUARIOS} -name "*${1}" |wc -l )
        printf "%b" "$USUARIOS -|- $var\n" >> report.txt
    done
    echo Archivo generado    
    exit 0
fi
