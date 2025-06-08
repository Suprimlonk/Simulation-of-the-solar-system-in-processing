import peasy.*;
PeasyCam cam;
boolean camActiva=false;
// Declaración de objetos y otras cosas
PImage texturaSol;
PShape sol;
ArrayList<Planetas> planetas = new ArrayList<Planetas>();
ArrayList<Lunas> lunas = new ArrayList<Lunas>();
void setup(){
  size(2500,2000,P3D);
  //camara desactivada al inicio
  cam = new PeasyCam(this, 2000);
  cam.setActive(false);
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
  //utilizar la vista normal en caso de no darle click a los planetas
  if (!camActiva){
    camera();
  }
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
//detectar un click en processing
void mousePressed(){
  if(!camActiva){
    for(Planetas p:planetas){
      if(p.click_T(mouseX, mouseY)){
        planetaSeleccionado = p;
        cam.setActive(true); // Activar la PeasyCam
        cam.lookAt(p.getX(), p.getY(), 0, 100); // Hacer zoom al planeta
        camActiva = true;
        break;
      }
    }
  }
}
//detectar en caso de que se le de al ESC en el estado activo de la PeasyCam
void keyPressed(){
  if(key=ESC){
    key=0; //evitar que Key cierre el programa
    cam.setActive(false);
    camActiva=false;
    planetaSeleccionado=null;

  }
}