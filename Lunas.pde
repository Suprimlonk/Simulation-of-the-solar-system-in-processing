//codigo realizado por Marco Aurelio Tamez Robles

class Lunas extends Planetas {
  float vl_luna; //Velocidad angular de la luna
  float radio_orbita_luna; //Radio de la órbita de la luna
  float angulo_luna; //Ángulo actual de la luna en la órbita
  Planetas planetaPadre; //Planeta alrededor del que orbita la luna
  float po_yL; //posicion en y de la luna
  //Constructor de luna
  Lunas(Planetas padre,float p_yL, float vl_L, float r_o_l, float radio_luna, String texturaLuna) {
    //Llama al constructor de Planetas
    super(vl_L, 0, 0, radio_luna, texturaLuna, r_o_l, 0);
    planetaPadre = padre;
    po_yL=p_yL;
    vl_luna = vl_L;
    radio_orbita_luna = r_o_l;
    angulo_luna = random(TWO_PI);
  }
  //Muestra la luna y actualiza su posición orbital respecto al planeta padre
  void mostrar() {
    orbitas(); //Actualiza posición orbital de la luna
    pushMatrix();
    translate(po_x, po_y); //Mueve la luna a su posición
    rotateY(angulo_luna); //Aplica rotación en Y
    if (figura != null) {
      shape(figura); //Dibuja la esfera con textura
    } else {
      fill(180); //Color relleno si no hay textura
      sphere(radio_planetas); //Dibuja esfera simple
    }
    popMatrix();
  }
  //Calcula la posición de la luna respecto al planeta padre
  void orbitas() {
    angulo_luna += vl_luna; //Incrementa ángulo orbital
    po_x = planetaPadre.getX() + radio_orbita_luna * -cos(angulo_luna);
    po_y = planetaPadre.getY() + radio_orbita_luna * sin(angulo_luna);
  }
}
