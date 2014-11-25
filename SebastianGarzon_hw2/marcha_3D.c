//
//  marcha_3d.c
//  
//
//  Created by sebastian Garzon on 27/08/14.
//
//  No logro idenfificar una relación clara pero es evidente que entre mayor es las Distancia D de frontera, menor es la pendiente de crecimiento de los pasos. Por ejemplo del D(10) a D(20) se aumenta por un factor de más de 6 en los N, mientras que entre D(490) y D(500) el crecimiento en N es por un factor de 1.1 por lo tanto se observa que la derivada de la función de D y N (cualquiera sea) presenta un decaimiento rápido y comportamiento asintótico en los extremos.
//
//
//
//
//Incluye bibliotecas importantes
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define PI (3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128) // Pi con sus primeros 150 decimales, tomado del repositorio del Profesor Forero.

//Declara la existencia de una funcion que calcula los pasos en función de una frontera
int pasos_marcha3d_aleatoria(int frontera);
int main(int argc, char **argv){
    FILE* outfile;
    char nombrearchivo[100];
    double M;
    M=atof(argv[1]);
    int i,p,k,c,f,l;
    // areglo con fronteras
    int array_N[50];
    FILE* outf;
    int pasostotales;
    int promedio=0;
    //arreglo con pasos
    int array_prompasos[50];
    int limiteconteo;
    //metodo que crea rellena el arreglo de fronteras con valores ascendentes ( de 10 en 10 hasta 500)
    int sumador=10;
    for (i=0;i<50;i++){
        array_N[i]=sumador;
        sumador+=10;
    }
    // verifica que el numero ingresado sea mayor a 2. Si es menor da mensaje de error
    if (M<=2.0) {
        printf("El numero ingresado debe ser mayor a 2 \n");
    }
    // Toma los 50 valores de frontera, calcula los pasos totales con un metodo y calcula finalmente el promedio de pasos los cuales incluye en un arreglo.
    else{
        sprintf(nombrearchivo,"final_stats_3D_%.0f.dat",M);
        outf=fopen(nombrearchivo,"w");
        for(p=0;p<50;p++) {
            limiteconteo=array_N[p];
            for(k=0;k<M;k++){
                pasostotales= pasostotales+pasos_marcha3d_aleatoria(limiteconteo);
            }
            promedio= pasostotales/M;
            array_prompasos[p]=promedio;
        }
        for(l=0; l<50; l++) {
            c=array_N[l];
            f=array_prompasos[l];
            fprintf(outf,"%d\t%d\n", c, f);
        }
    }
    fclose(outf);
    printf("\n Ejecución finalizada \n ");
    return 0;
}

// Metodo que realiza una marcha aleatoria. Nota: Usé de guia un ejercicio similar que realicé en herramientas computacionales el semestre pasado.

int pasos_marcha3d_aleatoria(int frontera){
    double magnitud = 0;
    double phi;
    double theta;
    double x = 0;
    double y = 0;
    double z = 0;
    int pasos=0;
//srand48(L); no funciona, siempre genera lo mismo sin importar el número M. M=1 y M=n tienen los mismos valores, revisar.
    while (magnitud<frontera){
        theta= rand()*PI;
        phi= rand()*2*PI;
        x= x+(sin(theta)*cos(phi));
        y= y+(sin(theta)*sin(phi));
        z= z+cos(theta);
        magnitud=sqrt(pow(x,2)+pow(y,2)+pow(z,2));
        pasos++;
    }
    return pasos;
}
//ok_todo