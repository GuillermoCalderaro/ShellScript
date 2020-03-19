#!/bin/bash
# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no hoy lo hago
# y mañana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido
echo "Fecha y hora actual: "
date
echo "Su apellido y nombre es: "
echo "$apellido $nombre"
echo "Su usuario es: $(whoami)"
echo "Su directorio actual es: $(pwd)"
echo "El contenido de este directorio es $(ls)"
echo "El espacio libre en disco es: "
echo "$(df -h /dev/sda)"
echo "Quiero saber mas de ti!"
read -p 'Introduzca su edad: ' EDAD
echo "Nunca hubiese pensado que tenias $EDAD anios!"
echo "Donde vives?"
read DOMICILIO
echo "$DOMICILIO debe ser hermoso en esta epoca del anio"
echo "Bueno, me voy por ahora. Adios!!"
