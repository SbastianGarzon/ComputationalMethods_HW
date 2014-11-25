//
//  suma_digitos_pi.c
//  
//
//  Created by sebastian Garzon on 16/08/14.
//
//
#include <stdio.h>
int main (int argc, char **argv){
    int digitos;
    digitos= atoi(argv[1]);
    char ch;
    FILE *infile;
    int suma=0;
    if (digitos<=0 || digitos>2500000) {
        printf("Numero no permitido, intente de nuevo con un numero mayor a 0 y menor a 2.500.000 \n");
    }
    else
        infile=fopen("Pi_2500000.txt","r");
        int i=0;
        int contador=0;
        for(i=0;i<(digitos+2);i++){
            contador++;
            ch=fgetc(infile);
            ch=ch-'0';
            if(contador>2){
                suma=suma+ch;
            }
        }
    printf("\n La suma de los primeros %d digitos del número pi es de:  %d \n \n",digitos,suma);
    fclose (infile);
    return 0;
}
//Oktodo_terminado