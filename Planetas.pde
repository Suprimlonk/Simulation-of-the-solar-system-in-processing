//codigo realizado por Marco Aurelio Tamez Robles

class Planetas {
  float vl_x; //Velocidad angular en x
  float po_x, po_y, po_z; //Posiciones x e y
  float rotacion; //Rotación del planeta
  float radio_planetas; //Radio o tamaño del planeta
  float angulo; //Ángulo de rotación
  float radio_orbitas; //Radio de la órbita del planeta
  PImage textura; //Textura del planeta
  PShape figura; //aplicar textura para el planeta
  float velocidadOriginal; //guardar la velocidad original
  //Constructor
  Planetas(float v_x, float p_x, float ro, float ra_p, String archivo, float ra_o, float p_y) {
    vl_x = v_x;
    velocidadOriginal=v_x;
    po_x = p_x;
    po_y = p_y;
    rotacion = ro;
    radio_planetas = ra_p;
    angulo = random(TWO_PI);
    radio_orbitas = ra_o;
    //metodo para crear la esfera de los planetas
    textura = loadImage(archivo); //Carga la textura
    if (textura != null) {
      figura = createShape(SPHERE, radio_planetas); //Crea la figura esférica
      figura.setTexture(textura); //Aplica la textura a la figura
      figura.setStroke(false); //limpiar las figuras
    }
  }
  //Método que calcula la posición orbital y dibuja el planeta
  void planeta() {
    orbit(); //Actualiza posición orbital
    pushMatrix();
    translate(po_x, po_y, po_z);//Mueve al planeta a su posición
    angulo += rotacion; //Incrementa rotación
    rotateY(angulo); //Aplica rotación en Y
    rotateX(angulo); //aplica rotacion en X
    if (figura != null) {
      shape(figura); //Dibuja la esfera con textura
    } else {
      fill(255, 100); //Color de relleno si no hay textura
      sphere(radio_planetas); //Dibuja esfera simple
    }
    popMatrix();
  }
  //Crear una orbita para los planetas
  void orbit() {
    po_x = width / 2 + radio_orbitas * -cos(frameCount * vl_x);
    po_y = height / 2 + radio_orbitas * -sin(frameCount * vl_x);
    po_z = 0;
  }
  //Métodos para obtener la posicion de x,y,z
  float getX() {
    return po_x;
  }
  float getY() {
    return po_y;
  }
  float getZ(){
    return po_z;
  }
  // Método para detectar si el ratón ha hecho clic sobre un planeta
  // Método para detectar si el ratón ha hecho clic sobre un planeta
  boolean click_T(float mx, float my) {
    float sx = screenX(po_x, po_y, 0); //Posición en pantalla del planeta
    float sy = screenY(po_x, po_y, 0);
    float d = dist(mx, my, sx, sy); //Distancia entre el ratón y el planeta
    return d < radio_planetas; //Si está dentro del tamaño del planeta, devuelve true
  }
}
