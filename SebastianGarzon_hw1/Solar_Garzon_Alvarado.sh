#!/bin/sh
#  Garzón_Alvarado_Solar.sh
#
#
#  Created by sebastian Garzon on 2/08/14.
#
# Descarga del archivo con la informacion
wget https://raw.githubusercontent.com/forero/ComputationalMethodsData/master/hands_on/solar/monthrg.dat
# Metodo que crea un archivo con todos los datos obtenidos el mes de septiembre de 1994
awk< monthrg.dat '{if($2==9 && $1==1994) print $4}' > manchasSept1994.txt
# Metodo que recorre los resultados entre 1990 y 1950 seleccionando aquellos con más de 30 manchas promedio.
awk< monthrg.dat '{if($1>1899 && $1<1951 && $4>30) print $1" "$2" "$3 }'> masde30.txt
#Metodo que recorre los datos de manchas solares cada mes, identifica el mayor hasta el momento y guarda la información de la fila. Se usa variable 'year' para evitar problemas al leer en otro computador
awk < monthrg.dat 'BEGIN {maximo=mes=year=0} {if($4>maximo) maximo=$4 ; if($4==maximo) mes=$2; if($4==maximo) year=$1} END {print "Año: " year "\n" "Mes:" mes "\n" "Con un numero de: " maximo "\n" }'> maximo.txt
#Separador para indicar respuestas al taller
echo " ====================Respuestas====================\n"
# Metodo que da la respuesta a pregunta 1.
echo '1) El numero de manchas solares promedio observadas en el meses de septiembre de 1994: \n'
cat manchasSept1994.txt
echo ' '
#Metodo que da la respuesta a pregunta 2.
echo '2) El numero de meses entre 1900 y 1950 con mas de 30 manchas solares en promedio fue de: \n '
wc -l < masde30.txt
echo ' '
#Metodo que da la respuesta a pregunta 3
echo "3) El año y mes con mas manchas solares corresponde a: \n"
cat maximo.txt
#Metodo que elimina los archivos generados
rm manchasSept1994.txt
rm masde30.txt
rm maximo.txt
rm monthrg.dat
#Oktodo