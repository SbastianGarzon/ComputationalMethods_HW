#!/bin/sh
#  Garzon_Alvarado_Giro2014.sh
#  
#
#  Created by sebastian Garzon on 2/08/14.
#
# Metodo que descarga los datos
wget https://raw.githubusercontent.com/forero/ComputationalMethodsData/master/homework/hw_1/giro_2014.csv
# Metodo que realiza un archivo con las nacionalidades
awk -F "\"*,\"*" '{if (NR!=1)print $2}' giro_2014.csv > nacionalidad.txt
# Metodo que realiza un archivo con los equipos
awk -F "\"*,\"*" '{if (NR!=1)print $3}' giro_2014.csv > equipo.txt
# Metodo que une los nombres con un "_" para evitar leer confusiones al unir columnas
awk -F "\"*,\"*" '{if (NR!=1)print $1}' giro_2014.csv> nombres.txt
awk <nombres.txt '{print $1"_"$2}'>nombresok.txt
# Metodo que imprimer los tiempos de las etapas
awk -F "\"*,\"*" '{if (NR!=1) print $4" "$5" "$6" "$7" "$8" "$9" "$10" "$11" "$12" "$13" "$14" "$15" "$16" "$17" "$18" "$19" "$20" "$21" "$22" "$23" "$24}' giro_2014.csv > tiempos.txt
# Metodo que une los archivos de nombres arreglados y el tiempo
paste nombresok.txt tiempos.txt > datosGiro.txt
# Metodos que calculan el menor tiempo acumulado en cada etapa y guarda la información del nombre
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($2<menor) menor=$2;if($2==menor) nombre= $1} END{print "1º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($3<menor) menor=$3;if($3==menor) nombre= $1} END{print "2º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($4<menor) menor=$4;if($4==menor) nombre= $1} END{print "3º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($5<menor) menor=$5;if($5==menor) nombre= $1} END{print "4º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($6<menor) menor=$6;if($6==menor) nombre= $1} END{print "5º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($7<menor) menor=$7;if($7==menor) nombre= $1} END{print "6º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($8<menor) menor=$8;if($8==menor) nombre= $1} END{print "7º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($9<menor) menor=$9;if($9==menor) nombre= $1} END{print "8º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($10<menor) menor=$10;if($10==menor) nombre= $1} END{print "9º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($11<menor) menor=$11;if($11==menor) nombre= $1} END{print "10º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($12<menor) menor=$12;if($12==menor) nombre= $1} END{print "11º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($13<menor) menor=$13;if($13==menor) nombre= $1} END{print "12º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($14<menor) menor=$14;if($14==menor) nombre= $1} END{print "13º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($15<menor) menor=$15;if($15==menor) nombre= $1} END{print "14º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($16<menor) menor=$16;if($16==menor) nombre= $1} END{print "15º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($17<menor) menor=$17;if($17==menor) nombre= $1} END{print "16º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($18<menor) menor=$18;if($18==menor) nombre= $1} END{print "17º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($19<menor) menor=$19;if($19==menor) nombre= $1} END{print "18º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($20<menor) menor=$20;if($20==menor) nombre= $1} END{print "19º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($21<menor) menor=$21;if($21==menor) nombre= $1} END{print "20º etapa: "nombre" con " menor" segundos"}'>> ganadores.txt
awk < datosGiro.txt 'BEGIN {menor=1000000;nombre=" "} {if($22<menor) menor=$22;if($22==menor) nombre= $1} END{print "21º etapa: "nombre" con " menor" segundos \n"}'>> ganadores.txt
#Metodo que con Sort organiza las nacionalidades que se repiten y los pone seguidos, envia la respuesta a un archivo
sort nacionalidad.txt> nacionalidadSort.txt
#Metodo que con uniq elimina las lineas repetidas ( previamente organizadas) y envia la respuesta a otro archivo.
uniq nacionalidadSort.txt> numeroNacionalidades.txt
#Metodo que con Sort organiza los equipos que se repiten y los pone seguidos, envia la respuesta a un archivo
sort equipo.txt> equipoSort.txt
#Metodo que con uniq elimina las lineas repetidas ( previamente organizadas) y envia la respuesta a otro archivo.
uniq equipoSort.txt> numeroEquipos.txt
#Separador para indicar respuestas al taller
echo " ====================Respuestas====================\n"
# Retorna el numero de nacionalidades
echo "1) El numero de paises con competidores en el Giro de Italia es de:"
wc -l < numeroNacionalidades.txt
echo " "
#Retorna el numero de nacionalidades
echo "2) El numero de equipos en el Giro de Italia es de:"
wc -l < numeroEquipos.txt
echo " "
# Metodo que da la respuesta del punto 2)
echo "3) El poseedor de la Maglia Rosa al final de cada etapa fue: \n "
cat ganadores.txt
#Metodo que elimina los archivos creados
rm ganadores.txt
rm nacionalidad.txt
rm nacionalidadSort.txt
rm numeroEquipos.txt
rm numeroNacionalidades.txt
rm equipoSort.txt
rm nombresok.txt
rm tiempos.txt
rm nombres.txt
rm equipo.txt
rm giro_2014.csv
rm datosGiro.txt
#oktodo