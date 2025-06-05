class Planetas{
    float vl_x; //Velocidad en x
    float po_x; //posicion en x
    float po_y; //posicion en y
    float rotacion; //Rotacion del planeta
    float radio; //Radio o tamaño del planeta
    float angulo; //Angulos en los que aparece

    Planetas (float v_x, float p_x, float p_y, float ro, float ra,) { //Crear las variables que usaremos a lo largo del codigo
        vl_x=v_x;
        po_x=p_x;
        po_y=p_y;
        rotacion=ro;
        radio=ra;
        angulo=random(TWO_PI);
    }
     //todos los aspectos necesarios de un planeta
    void planeta(){
        pushmatix();
        fill(255,100);
        rotate(angulo);
        translate(x, y, z);
        ellipse(0, 0, radio*2, radio*2);
        if (Planetas != null){
            for (int i = 0; i < Planetas; length; i++) {
                Planetas[i].planeta();
            }
        }
}    }
    //crear la orbita de los planetas
    void orbit(){

    }
    //crear las lunas
    void spawnmooons(){

    }
}
