import peasy.*;
PeasyCam cam;
// Declaración de objetos
ArrayList<Planetas> planetas = new ArrayList<Planetas>();
ArrayList<Lunas> lunas = new ArrayList<Lunas>();
void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 500);
  // Constructor: velocidad angular, pos x, rotación, tamaño, textura, radio órbita, pos y
  planetas.add(new Planetas(0.01, 0, 0.01, 40, "tierra.jpg", 200, 0));
  // Constructor: planeta padre, velocidad lunar, radio órbita luna, tamaño luna, textura
  lunas.add(new Lunas(tierra, 0.05, 60, 10, "luna.jpg"));
}
void draw() {
  background(0);
  lights();
  for (Planetas p:planetas){
    p.planeta();
  }
  for (Lunas l : lunas) {
  l.mostrar();
  }
}

