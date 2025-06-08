import peasy.*;
PeasyCam cam;
// Declaración de objetos y otras cosas
PImage texturaSol;
PShape sol;
ArrayList<Planetas> planetas = new ArrayList<Planetas>();
ArrayList<Lunas> lunas = new ArrayList<Lunas>();
void setup() {
  size(800, 800, P3D);
  //Textura del sol
  texturaSol=loadImage("sol.jpg");
  sol=createShape(SPHERE,100);
  sol.setTexture(texturaSol);
  sol.setStroke(false);
  // Constructor: velocidad angular, pos x, rotación, tamaño, textura, radio órbita, pos y
  planetas.add(new Planetas(0.01, 0, 0.01, 40, "tierra.jpg", 200, 0));
  // Constructor: planeta padre, velocidad lunar, radio órbita luna, tamaño luna, textura
  lunas.add(new Lunas(planetas.get(0), 0.05, 60, 10, "luna.jpg"));
}
void draw() {
  background(0);
  lights();
  // crear el sol
  pushMatrix();
  translate(width/2, height/2, 0);
  shape(sol);
  popMatrix();
  for (Planetas p:planetas){
    p.planeta();
  }
  for (Lunas l : lunas) {
  l.mostrar();
  }
}