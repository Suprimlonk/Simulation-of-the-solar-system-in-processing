import peasy.*;
PeasyCam cam;
// Declaración de objetos
Planetas tierra;
Lunas luna;
void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 500);
  // Constructor: velocidad angular, pos x, rotación, tamaño, textura, radio órbita, pos y
  tierra = new Planetas(0.01, 0, 0.01, 40, "tierra.jpg", 200, 0);
  // Constructor: planeta padre, velocidad lunar, radio órbita luna, tamaño luna, textura
  luna = new Lunas(tierra, 0.05, 60, 10, "luna.jpg");
}
void draw() {
  background(0);
  lights();
  tierra.planeta(); // dibuja el planeta y actualiza su órbita
  luna.mostrar();   // dibuja la luna orbitando al planeta
}
