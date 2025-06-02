class Planetas{
    float vl_x; //Velocidad en x
    float po_x; //posicion en x
    float po_y; //posicion en y
    float rotacion; //Rotacion del planeta
    float radio; //Radio o tamaño dle planeta
    float angulo; //Angulos en los que aparece

    Planetas (float v_x, float p_x, float p_y, float ro, float ra,) { //Crear las variables que usaremos a lo largo del codigo
        vl_x=v_x;
        po_x=p_x;
        po_y=p_y;
        rotacion=ro;
        radio=ra;
        angulo=random(TWO_PI);
    }

    
}
