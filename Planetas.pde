import processing.core.PApplet;

public class Main extends PApplet {
    public void settings() {
        size(600, 400);
    }

    public void setup() {
        background(0);
    }

    public void draw() {
        ellipse(mouseX, mouseY, 50, 50);
    }

    public static void main(String[] args) {
        PApplet.main("Main");
    }
}
