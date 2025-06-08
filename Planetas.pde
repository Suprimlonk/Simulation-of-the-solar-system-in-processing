class Planetas{
    float vl_x; //Velocidad en x
    float po_x; //posicion en x
    float po_y; //posicion en y
    PImage textura; //Texturas para los planetas
    float rotacion; //Rotacion del planeta
    float radio_panetas; //Radio o tamaño del planeta
    float angulo; //Angulos en los que aparece
    float radio_orbitas; //radio de cada orbita

    Planetas (float v_x, float p_x, float ro, float ra_p, String arch, float ra_o, float p_y) { //Crear las variables que usaremos a lo largo del codigo
        vl_x=v_x;
        po_x=p_x;
        rotacion=ro;
        radio_planetas=ra_p;
        angulo=random(TWO_PI);
        textura=loadImage(arch);
        radio_orbitas=ra_o;
        po_y=p_y;
    }
     //todos los aspectos necesarios de un planeta
    void planeta(){
        pushMatix();
        fill(255,100);
        rotate(angulo);
        translate(p_x, 0, 0)
        sphere(ra_p);
        if (Planetas != null){
            for (int i = 0; i < Planetas.length; i++) {
                Planetas[i].planeta();
            }
        }
    }
    //crear la orbita de los planetas 
    void orbit(){
        //ecuaciones parametricas para las orbitas
        p_x=width/2 + ra_o*cos(frameCount*v_x);
        p_y=height/2 + ra_o*sin(frameCount*v_x);
    }
    //crear las lunas
    void spawnmooons(){

    }
}
