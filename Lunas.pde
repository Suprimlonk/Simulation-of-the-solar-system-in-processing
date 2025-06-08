//crear clase para las lunas que tenga la composicion de planetas
class Lunas extends Planetas{
    Lunas(float p_xL, float p_yL, float v_L, float ra_oL); {
    //Herredar las variables necesarias para que la luna lo siga
    super(p_x,p_y);
    }
    void mostrar(){

    }
    void orbitas(){
        //hacer que las lunas sigan el planeta y orbiten al rededor de este
        p_xL= p_x + width/2 + ra_oL*cos(frameCount*v_L);
        p_yL=p_y + height/2 + ra_o*sin(frameCount*v_x);
    }
}