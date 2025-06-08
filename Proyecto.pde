import peasy.*;
PeasyCam cam;
// Declaración de objetos y otras cosas
PImage texturaSol;
PShape sol;
ArrayList<Planetas> planetas = new ArrayList<Planetas>();
ArrayList<Lunas> lunas = new ArrayList<Lunas>();
void setup(){
  size(2500,2000,P3D);
  //Textura del sol
  texturaSol=loadImage("sol.jpg");
  sol=createShape(SPHERE,50);
  sol.setTexture(texturaSol);
  sol.setStroke(false);
  // Constructor: velocidad angular, pos x inicial, rotación, tamaño, textura, radio órbita, pos y
  planetas.add(new Planetas(0.01, 0, 0.01, 10, "mercurio.jpg",100,0));
  planetas.add(new Planetas(0.007, 0, -0.01, 20, "venus.jpg", 150,0));
  planetas.add(new Planetas(0.006, 0, 0.01, 15, "tierra.jpg", 200, 0));
  planetas.add(new Planetas(0.005, 0, -0.01, 10, "marte.jpg", 250, 0));
  planetas.add(new Planetas(0.004, 0, 0.01, 35, "jupiter.jpg", 350, 0));
  planetas.add(new Planetas(0.0035, 0, 0.01, 30, "saturno.jpg", 425,0));
  planetas.add(new Planetas(0.003, 0, -0.01, 25, "urano.jpg", 525, 0));
  planetas.add(new Planetas(0.0025,0,0.01,20, "neptuno.jpg",600,0));
  
  // Constructor: planeta padre, velocidad lunar, radio órbita luna, tamaño luna, textura
  lunas.add(new Lunas(planetas.get(2), 0.01, 30, 5, "luna.jpg"));
  lunas.add(new Lunas(planetas.get(3), 0.01, 40, 5, "phobos.jpg"));
  lunas.add(new Lunas(planetas.get(3), 0.01, 30, 5, "deimos.jpg"));
}
void draw(){
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
