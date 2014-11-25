#Juan Sebastian Garzon
import sys
import random
import numpy as np
import math
lista1=[]
lista2=[]
lista3=[]
Ms=1.988*(math.pow(10,30)) # Kg Masa del sol
Mt=5.97219*(math.pow(10,24)) # Kg Masa de la tierra
t= 31536000 # segundos, periodo de la tierra
G= 6.6738*(math.pow(10,-11)) #Constante de gravitacion universal, unidades SI
DistSolTierra=149600000000.0 # Metros Distancia sol a la tierra
h=0.000000000000001 # h para las derivadas
#Sistema de coordenadas para simplificar el problema
MSol= Ms/Ms
MTierra=Mt/Ms
periodo= t/t # anios
G_UA= G*(math.pow(t,2))*(Ms)/(math.pow(DistSolTierra,3))
SolTierra= DistSolTierra/DistSolTierra

#No estoy seguro de la formula, hice sumatoria de fuerzas simple (Sin meterme en temas de vectores y fuerzas atractivas). Esta fue la unica manera de obtener una ecuacion con 3 ceros.
def fuerzasX(x):
    h=1-x
    picuadrado=math.pow(math.pi,2)
    return -(MSol/math.pow(x,2))+math.pow(h,2)/math.pow(MTierra,-1)-((4*x*picuadrado)/(periodo*G_UA))
def derivadaFx(x,h):
    return (fuerzasX(x+h) - fuerzasX(x-h))/(2.0*h)
x_func1=1.002 #para L1
x_func2=0.9999 #para L2
x_func3=-1 #para L3

#Para L1
while (abs((fuerzasX(x_func1))) > 1E-1):
    delta_x1 = -fuerzasX(x_func1)/derivadaFx(x_func1,h)
    x_func1 = x_func1 + delta_x1
    lista1.append(x_func1)
#Para L2
while (abs((fuerzasX(x_func2))) > 1E-1):
        delta_x2 = -fuerzasX(x_func2)/derivadaFx(x_func2,h)
        x_func2 = x_func2 + delta_x2
        lista2.append(x_func2)
#Para L3
while (abs((fuerzasX(x_func3))) > 1E-3):
    delta_x3 = -fuerzasX(x_func3)/derivadaFx(x_func3,h)
    x_func3 = x_func3 + delta_x3
    lista3.append(x_func3)

c = list(set(lista1 + lista2+lista3))
c.sort()
archivo=open("puntos_lagrange.dat",'w')
for i in range (len(c)):
    archivo.write(str(c[i])+'\t'+'0'+'\n')



