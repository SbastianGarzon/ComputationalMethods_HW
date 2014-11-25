//
//  trayectoria_esfera.c
//  
//
//  Created by sebastian Garzon on 16/08/14.
//
//

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
int main(int argc, char **argv){
    int i;
    double phi;
    double theta;
    double phi2;
    double theta2;
    double distanciatetha;
    double distanciaphi;
    double sumadortetha;
    double sumadorphi;
    double posicionphi;
    double posiciontetha;
    double phi1[101];
    double theta1[101];
    double contador;
    theta= atof(argv[1]);
    phi= atof(argv[2]);
    theta2= atof(argv[3]);
    phi2= atof(argv[4]);
    if (phi<0.0||theta<0.0||phi2<0.0||theta2<0.0||phi>360.0||theta>180.0||phi2>360.0||theta2>180.0)
    {
        printf("\n Los ángulos phi1, phi2,theta1 o theta2 exceden los límites, verifique que: 0<=phi=<180 y 0=<theta=<360\n");
    }
    
    else if(phi==phi2 &&theta==theta2){
        
        printf("\n Las coordenas de los 2 puntos corresponden a la misma ubicación, intente con 2 puntos con diferentes coordenadas \n");
    }
    else
    {
        distanciaphi=abs(phi-phi2);
        distanciatetha=abs(theta-theta2);
        sumadorphi=distanciaphi/100;
        sumadortetha=distanciatetha/100;
        for(i=0;i<101;i++){
            posiciontetha= theta+(i*sumadortetha);
            posicionphi= phi+(i*sumadorphi);
            phi1[i]= posicionphi;
            theta1[i]= posiciontetha;
            contador++;
            printf("%.2f\t%.2f\t\%.2f\n",contador, theta1[i],phi1[i]);
        }

    }
    
    return 0.0;
}
//revisar fisica del problema