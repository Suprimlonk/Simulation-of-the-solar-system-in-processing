//codigo hecho por Marco Aurelio Tamez Robles

 // Declaración de objetos y otras cosas
PImage texturaSol;
PShape sol;
PImage bg;
int y;
PImage anilloSaturno;
ArrayList<Planetas> planetas = new ArrayList<Planetas>();
ArrayList<Lunas> lunas = new ArrayList<Lunas>();
//variables para seguir los planetas al dar click
Planetas planetaSeleccionado=null;
boolean seguirPlaneta=false;
float distanciaCam = 1000;  // zoom inicial
void setup(){
  fullScreen(P3D);
  anilloSaturno=loadImage("Anillo.png");
// Cámara fija desde arriba (vista cenital)
  distanciaCam=1000;
//Textura del sol
  texturaSol=loadImage("sol.jpg");
  sol=createShape(SPHERE,50);
  sol.setTexture(texturaSol);
  sol.setStroke(false);
  //Constructor: velocidad angular, pos x inicial, rotación, tamaño, textura, radio órbita, pos y
  planetas.add(new Planetas(0.01, 0, 0.01, 5, "mercurio.jpg",100,0));
  planetas.add(new Planetas(0.007, 0, -0.01, 15, "venus.jpg", 125,0));
  planetas.add(new Planetas(0.006, 0, 0.01, 10, "tierra.jpg", 155, 0));
  planetas.add(new Planetas(0.005, 0, -0.01, 5, "marte.jpg", 190, 0));
  planetas.add(new Planetas(0.004, 0, 0.01, 30, "jupiter.jpg", 250, 0));
  planetas.add(new Planetas(0.0035, 0, 0.01, 25, "saturno.jpg", 350,0));
  planetas.add(new Planetas(0.003, 0, -0.01, 20, "urano.jpg", 425, 0));
  planetas.add(new Planetas(0.0025,0, 0.01, 15, "neptuno.jpg", 490,0));
  //Constructor: planeta padre, posicion en y, velocidad lunar, radio órbita luna, tamaño luna, textura
  lunas.add(new Lunas(planetas.get(2), 2, 0.01, 25, 3, "luna.jpg"));
  lunas.add(new Lunas(planetas.get(3), 2, 0.015, 15, 2.5, "phobos.jpg"));
  lunas.add(new Lunas(planetas.get(3), 2, 0.01, 20, 3, "deimos.jpg"));
  lunas.add(new Lunas(planetas.get(4), 2, 0.02, 40, 6, "luna.jpg"));//lunas de jupiter
  lunas.add(new Lunas(planetas.get(4), 2, 0.015, 45, 6, "phobos.jpg"));
  lunas.add(new Lunas(planetas.get(4), 2, 0.01, 60, 7, "deimos.jpg"));
  lunas.add(new Lunas(planetas.get(4), 2, 0.008, 67, 6, "phobos.jpg"));
  lunas.add(new Lunas(planetas.get(6), 2, 0.0015, 40, 4, "deimos.jpg"));//lunas urano
  lunas.add(new Lunas(planetas.get(6), 2, 0.001, 30, 5, "luna.jpg"));
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
// variables de Posición del planeta
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
    // Traza las órbitas
  pushStyle();
  noFill();
  stroke(255, 100);
  strokeWeight(1);
  for (Planetas p : planetas) {
    pushMatrix();
    translate(width / 2, height / 2, 0);
    ellipse(0, 0, 2 * p.radio_orbitas, 2 * p.radio_orbitas);
    popMatrix();
  }
// crear el sol
  pushMatrix();
  translate(width/2, height/2, 0);
  shape(sol);
  popMatrix();
//dibujar los planetas y lunas
for (int i = 0; i < planetas.size(); i++) {
  Planetas p = planetas.get(i);
  p.planeta();
//dibujar el anillo de saturno
  if (i == 5 && anilloSaturno != null) { // Saturno
    pushMatrix();
    translate(p.getX(), p.getY(), p.getZ());
    rotateX(p.angulo);
    rotateY(p.angulo);
    imageMode(CENTER);
    tint(255, 200); // para hacer el anillo visible y translúcido
    image(anilloSaturno, 0, 0, 100, 125);
    noTint();
    popMatrix();
    }
  }
  for (Lunas l : lunas) {
  l.mostrar();
  }
// Cartel con instrucciones
  pushStyle();
  fill(0, 150);//Fondo del cartel
  noStroke();
  rect(20, 20, 360, 60);//Tamaño del cartel
  fill(255);
  textSize(25);
  textAlign(LEFT, TOP);
  text("Haz click en un planeta para hacerle zoom\nESC para salir del modo de observación", 30, 30);
  popStyle();
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