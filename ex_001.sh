#!/bin/bash
# # Este script permite la busqueda y la caracterización de un fichero o directorio
toilet -f mono12 -F metal -F border "find it"
echo "                                                  by Andrés quevedo Díaz"
################################################## DEFINICIÓN DE COLORES

color1="\e[1;7;35m"
fincolor="\e[0m"

color2="\e[1;7;34m"
fincolor="\e[0m"

################################################## FUNCIONES

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
echo ""
}

############# función de permisos de lectura

permisosr()
{
if [ -r $file ]; then
        echo "Tiene permiso de lectura"
else
        echo "no tiene permiso de lectura"
fi
}

############# función de permisos de escritura

permisosw()
{
if [ -w $file ]; then
        echo "Tiene permiso de escritura"
else
        echo "No tiene permiso de escritura"
fi
}

############ función de permisos de ejecución

permisosx()
{
if [ -x $file ]; then
        echo "Tiene permiso de ejecución"
else
        echo "No tiene permiso de ejecución"
fi
}

############ función de localización

aqui=$(pwd)
localizarf()
{
localf=$(find $aqui -type f -iname $file )
echo $localf
}

localizard()
{
locald=$(find $aqui -type d -iname $file )
echo $locald
}

############ función continuar

continuar()
{
echo -n $color2"¿Desea continuar? (s/n) "$fincolor
read continuar
if [ $continuar = "s" ]; then
        echo ""
        menu

elif [ $continuar = "n" ]; then
        salir
else
        echo $continuar no es una opción
        continuar
fi
}

############ función salir

salir()
{
exit
}

############ función menu

menu()
{
echo $color2"      Parámetros de busqueda     "$fincolor
read parametro
if ls | grep $parametro; then
        echo ""
        explorar
else
        echo "No existen resultados"
        echo ""
        continuar
fi
}

############ función explorar

explorar()
{
echo $color2"Seleccione la opción a explorar: "$fincolor
read file
principal
continuar
}

############ PRIMERA LLAMADA

menu

