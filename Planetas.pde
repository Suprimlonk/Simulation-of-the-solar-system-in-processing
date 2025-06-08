class Planetas{
    float vl_x; //Velocidad en x
    float po_x; //posicion en x
    PImage textura; //Texturas para los planetas
    float rotacion; //Rotacion del planeta
    float radio; //Radio o tamaño del planeta
    float angulo; //Angulos en los que aparece

    Planetas (float v_x, float p_x, float ro, float ra, String arch) { //Crear las variables que usaremos a lo largo del codigo
        vl_x=v_x;
        po_x=p_x;
        rotacion=ro;
        radio=ra;
        angulo=random(TWO_PI);
        textura=loadImage(arch);
    }
     //todos los aspectos necesarios de un planeta
    void planeta(){
        pushmatix();
        fill(255,100);
        rotate(angulo);
        translate(p_x, 0, 0)
        sphere(radio);
        if (Planetas != null){
            for (int i = 0; i < Planetas.length; i++) {
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
