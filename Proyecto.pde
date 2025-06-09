// Declaración de objetos y otras cosas
PImage texturaSol;
PShape sol;
PImage bg;
int y;
ArrayList<Planetas> planetas = new ArrayList<Planetas>();
ArrayList<Lunas> lunas = new ArrayList<Lunas>();
//variables para seguir los planetas al dar click
Planetas planetaSeleccionado=null;
boolean seguirPlaneta=false;
float distanciaCam = 1000;  // zoom inicial

void setup(){
  fullScreen(P3D);
// Cámara fija desde arriba (vista cenital)
  distanciaCam=1000;
//Textura del sol
  texturaSol=loadImage("sol.jpg");
  sol=createShape(SPHERE,50);
  sol.setTexture(texturaSol);
  sol.setStroke(false);
  //Constructor: velocidad angular, pos x inicial, rotación, tamaño, textura, radio órbita, pos y
  planetas.add(new Planetas(0.01, 0, 0.01, 10, "mercurio.jpg",100,0));
  planetas.add(new Planetas(0.007, 0, -0.01, 20, "venus.jpg", 150,0));
  planetas.add(new Planetas(0.006, 0, 0.01, 15, "tierra.jpg", 200, 0));
  planetas.add(new Planetas(0.005, 0, -0.01, 10, "marte.jpg", 250, 0));
  planetas.add(new Planetas(0.004, 0, 0.01, 35, "jupiter.jpg", 320, 0));
  planetas.add(new Planetas(0.0035, 0, 0.01, 30, "saturno.jpg", 400,0));
  planetas.add(new Planetas(0.003, 0, -0.01, 25, "urano.jpg", 480, 0));
  planetas.add(new Planetas(0.0025,0,0.01,20, "neptuno.jpg",550,0));
  //Constructor: planeta padre, posicion en y, velocidad lunar, radio órbita luna, tamaño luna, textura
  lunas.add(new Lunas(planetas.get(2), 2, 0.01, 30, 5, "luna.jpg"));
  lunas.add(new Lunas(planetas.get(3), 2, 0.01, 40, 5, "phobos.jpg"));
  lunas.add(new Lunas(planetas.get(3), 2, 0.01, 30, 5, "deimos.jpg"));
  //imagen para el fondo
  bg=loadImage("espacio.jpg");
  if(bg != null) {
    bg.resize(displayWidth, displayHeight);
  }
}

void draw(){
  //crear el fondo que se va a usar
  background(bg);
  lights();
  stroke(226, 204, 0);
  y++;
  if (y > height) {
    y = 0;
  }
//Crar la manera para que se siga un planeta al dar click
      if (seguirPlaneta && planetaSeleccionado != null) {
// Posición del planeta
    float px = planetaSeleccionado.getX();
    float py = planetaSeleccionado.getY();
    float pz = planetaSeleccionado.getZ();
// Camara fija detras y un poco arriba del planeta
    float camX = px;
    float camY = py + 100;
    float camZ = pz + 300;
//Mirar hacia el planeta
    camera(camX, camY, camZ, px, py, pz, 0, 1, 0);
  } else {
//Vista general
    camera(width/2, height/2, distanciaCam, width/2, height/2, 0, 0, 1, 0);
  }
// crear el sol
  pushMatrix();
  translate(width/2, height/2, 0);
  shape(sol);
  popMatrix();
//dibujar los planetas y lunas
  for (Planetas p:planetas){
    p.planeta();
  }
  for (Lunas l : lunas) {
  l.mostrar();
  }
}
//detectar un click al planeta
void mousePressed(){
  for(Planetas p:planetas){
   if(p.click_T(mouseX, mouseY)){
     planetaSeleccionado = p;
     seguirPlaneta=true;
     break;
    }
  }
}

//detectar cuando de da ESC para salir al modo de vizualizacion completa
void keyPressed(){
  if (key==ESC){
    key=0; //evitar que Key cierre el programa
    seguirPlaneta=false;
    planetaSeleccionado=null;
  }
}