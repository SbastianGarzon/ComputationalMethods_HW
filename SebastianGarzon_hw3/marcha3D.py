#Juan Sebastian Garzon Alvarado
#Este es una traduccion del codigo de la tarea pasado con una correcion en una linea que sumaba pasos anteriormente sumados por error... adicionalmente se incluye un control a los numeros random y que por lo tanto sean los mismos en una misma marcha aleatoria con diferentes r pero diferentes en cada marcha M.
import sys
import random
import math
import time
start_time = time.time()
#Creo la listaDistancia sin un recorrido para ahorrar tiempo
listaDistancia=[10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500]
listaPasos=[]
marchas=int(sys.argv[1])
radiomaximo=500
pasosTotales=0;
promedio=0;
nombrearchivo="final_stats_3D_"+str(marchas)+".dat"
#Tomado de mi tarea en herramientas computacionales
def pasos_marcha3d_aleatoria(int):
    magnitud = 0;
    phi=0.0;
    theta=0.0;
    x = 0.0;
    y = 0.0;
    z = 0.0;
    pasos=0.0;
    limiteconteo=0;
    radiomaximo=int;
    while magnitud<radiomaximo:
        theta=random.random()*math.pi
        phi= random.random()*2*math.pi
        x= x+(math.sin(theta)*math.cos(phi))
        y= y+(math.sin(theta)*math.sin(phi))
        z= z+(math.cos(theta))
        magnitud=math.sqrt((x**2)+(y**2)+(z**2))
        pasos+=1
    return pasos
if marchas<=2.0:
    print "El numero debe ser mayor a 2.0"
else:
    for p in range (0,50):
        limiteconteo=listaDistancia[p]
        pasosTotales=0
        for k in range(0,marchas):
            random.seed(k)
            pasosTotales+=pasos_marcha3d_aleatoria(limiteconteo)
        promedio=pasosTotales/marchas
        listaPasos.append(promedio)
    archivo=open(nombrearchivo,'w')
    for i in range (len(listaDistancia)):
        archivo.write(str(listaDistancia[i])+" "+str(listaPasos[i])+'\n')
    tiempo=time.time()-start_time
    tiempo= round(tiempo,2)
    print("Ejecutado correctamente en "+str(tiempo)+" segundos")
