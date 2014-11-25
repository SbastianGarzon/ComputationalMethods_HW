#!/bin/sh
#  Garzon_Alvarado_Notas.sh
#  
#
#  Created by sebastian Garzon on 2/08/14.
#
# Descarga archivo con datos
wget https://raw.githubusercontent.com/forero/ComputationalMethodsData/master/homework/hw_1/notas_fisicaII_201320.dat
# Crea archivo con personas que pasaron y calcula el promedio de los 3 parciales
awk< notas_fisicaII_201320.dat '{ if($6>59.99) print ($1+$2+$3)/3}'> pasaron.txt
# Identifica el mejor y peor promedio entre las personas que pasaron
awk < pasaron.txt 'BEGIN {maximo = 0} {if($1>maximo) maximo=$1} END {print maximo}'> maximo.txt
awk < pasaron.txt 'BEGIN {minimo = 1000} {if($1<minimo) minimo=$1} END {print minimo}'>minimo.txt
# Realiza un recorrido entre las columnas, si la persona perdió un parcial suma 1 a p (de perdio), al final si p es exactamente igual a 1 imprimer la nota final del estudiante
awk< notas_fisicaII_201320.dat '{p=0;if($1<60)p++;if($2<60)p++;if($3<60)p++;if(p==1) print $6}'> perdieronExactamente1.txt
# Realiza un recorrido por la columna en la que va sumando 1 a pasaron si la nota definitiva es 60 o mas, al final retorna el numero de personas que pasaron.
awk< perdieronExactamente1.txt 'BEGIN{pasaron=0}{if($1>59.99) pasaron++} END{print pasaron}'> perdieronExactamente1PasaronMateria.txt
#Separador para indicar respuestas al taller
echo " ====================Respuestas====================\n"
#Responde pregunta 1
echo '1) El numero de personas que perdieron exactamente 1 parcial y pasaron la materia es de: \n'
cat perdieronExactamente1PasaronMateria.txt
echo ''
#Responde pregunta 2
echo '2.1) El mejor promedio de parciales entre las personas que pasaron es de: \n'
cat maximo.txt
echo''
echo '2.2) El peor promedio de parciales entre las personas que pasaron es de: \n'
cat minimo.txt
echo ''
#Elimina archivos creados y descargados
rm pasaron.txt
rm maximo.txt
rm minimo.txt
rm notas_fisicaII_201320.dat
rm perdieronExactamente1.txt
rm perdieronExactamente1PasaronMateria.txt
#oktodo