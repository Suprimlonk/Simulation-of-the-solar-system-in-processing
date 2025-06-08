//crear las camaras
import peasy.*;
peasyCam cam;
//otras cosas como llamar las clases para los objetos
PImage textura;
planeta[] Planetas;
luna[] Lunas;
void setup(){
    size(800,800,P3D);
//el constructor planeta es "Planetas(velocidad angular, posicion en x, velocidad de rotacion en su eje, tamaño planeta, textura, float radio de la órbita del planeta, posicion en y)"
    tierra=new Planetas(0.01, 0, 0.01, 40, "tierra.jpg", 200, 0)
//el constructor luna es "Lunas(el planeta que orbita, velocidad angular lunar, radio de la órbita lunar, tamaño de la luna, imagen)
    luna=new Lunas(tierra, 0.05, 60, 10, "luna.jpg")

}

void draw(){

}