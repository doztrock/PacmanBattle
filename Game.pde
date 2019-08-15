Movable personaje = new Movable(ShapeType.Ellipse, 150, 50);
Movable obstaculo = new Movable(ShapeType.Rect, 50, 50);
int iteracion = 0;

void setup() {
  size(800, 600);
} 

void draw() {

  background(0);

  if (iteracion % 15 == 0) {
    obstaculo.setSize((int)random(10, 250), (int)random(10, 250));
  }

  obstaculo.setFill(200, 150, 40);
  obstaculo.setStroke(255, 255, 255);  
  obstaculo.move();

  personaje.setFill(150, 130, 200);
  personaje.setStroke(255, 0, 0);
  personaje.move(mouseX, mouseY);

  if (iteracion % 25 == 0) {
    obstaculo.setX((int)random(1, 800));
    obstaculo.setY((int)random(1, 600));
  }

  iteracion++;
}
