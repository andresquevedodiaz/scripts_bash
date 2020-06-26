#!/bin/bash
# Este script determina si el argumento es un fichero o un directorio
toilet -f mono12 -F metal -F border "find it"
echo "                                                  by Andrés quevedo Díaz"
# definición de colores
color1="\e[1;7;37m"
fincolor1="\e[0m"
######## funciones ########
# función de localización
localizarf()
{
localf=$(find . -type f -iname $file* )
echo $localf
}

localizard()
{
locald=$(find . -type d -iname $file* )
echo $locald
}

# función de permisos de lectura
permisosr()
{
if [ -r $file ]; then
	echo "Tiene permiso de lectura"
else
	echo "no tiene permiso de lectura"
fi
}
# función de permisos de escritura
permisosw()
{
if [ -w $file ]; then
	echo "Tiene permiso de escritura"
else
	echo "No tiene permiso de escritura"
fi
}
# función de permisos de ejecución
permisosx()
{
if [ -x $file ]; then
	echo "Tiene permiso de ejecución"
else
	echo "No tiene permiso de ejecución"
fi
}
#función salir
salir()
{
exit
}

# Función principal
principal()
{
if [ -e $file ]; then
	if [ -f $file ]; then
		echo "$file es un fichero"
		permisosr
		permisosw
		permisosx
		localizarf
	else
		echo "$file es un directorio"
		permisosr
		permisosw
		permisosx
		localizard
	fi
else 
	echo "$file no existe"
fi
}

# menú principal
echo -n $color1" Parámetros de busqueda "$fincolor1
read file

principal



