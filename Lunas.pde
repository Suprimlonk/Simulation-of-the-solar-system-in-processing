class Lunas extends Planetas {
  float vl_luna; //velocidad angular de la luna
  float radio_orbita_luna; //radio de la órbita de la luna
  float angulo_luna; //ángulo actual en la órbita
  Planetas planetaPadre; //planeta que orbita

  Lunas(Planetas padre, float vl_L, float r_o_l, float radio_luna, String texturaLuna) {
    //Llamada al constructor de la clase Planetas con valores dummy
    super(vl_L, 0, 0, radio_luna, texturaLuna, r_o_l, 0);
    planetaPadre = padre;
    vl_luna = vl_L;
    radio_orbita_luna = r_o_l;
    angulo_luna = random(TWO_PI);
  }
    //utilizar un metodo para mostrar las lunas
  void mostrar() {
    orbitas(); //actualiza la posición de la luna
    pushMatrix();
    translate(po_x, po_y);
    rotateY(angulo_luna);
    if (textura != null) {
      textureMode(NORMAL);
      beginShape();
      texture(textura);
      sphere(radio_planetas);
      endShape();
    } else {
      fill(180);
      sphere(radio_planetas);
    }
    popMatrix();
  }
    //crear las orbitas y que sigan a los planetas necesarios
  void orbitas() {
    angulo_luna += vl_luna;
    po_x = planetaPadre.getX() + radio_orbita_luna * cos(angulo_luna);
    po_y = planetaPadre.getY() + radio_orbita_luna * sin(angulo_luna);
  }
}
