class Planetas{
    float vl_x; //Velocidad en x
    float po_x; //posicion en x
    float po_y; //posicion en y
    PImage textura; //Texturas para los planetas
    float rotacion; //Rotacion del planeta
    float radio_planetas; //Radio o tamaño del planeta
    float angulo; //Angulos en los que aparece
    float radio_orbitas; //radio de cada orbita

    Planetas (float v_x, float p_x, float ro, float ra_p, String arch, float ra_o, float p_y) { //Crear las variables que usaremos a lo largo del codigo
        vl_x=v_x;
        po_x=p_x;
        po_y=p_y;
        rotacion=ro;
        radio_planetas=ra_p;
        angulo=random(TWO_PI);
        textura=loadImage(arch);
        radio_orbitas=ra_o;
    }
     //todos los aspectos necesarios de un planeta
    void planeta(){
        orbit();
        pushMatrix();
        translate(po_x, po_y);
        angulo+=rotacion;
        rotateY(angulo);
        if (textura != null){
            textureMode(NORMAL);
            beginShape();
            texture(textura);
            sphere(radio_planetas);
            endShape();
        } else {
            fill(255, 100);
            sphere(radio_planetas);
        }
        popMatrix();
    }
    //crear la orbita de los planetas 
    void orbit(){
        //ecuaciones parametricas para las orbitas
        po_x=width/2 + radio_orbitas*cos(frameCount*vl_x);
        po_y=height/2 + radio_orbitas*sin(frameCount*vl_x);
    }
    //vectores para sacar sus posiciones
    float getX(){
        return po_x;
    }
    float getY(){
        return po_y;
    }
}