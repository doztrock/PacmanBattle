Message message = new Message();
Movable m = new Movable(150, 50);
int iteracion = 0;

void setup() {
  size(800, 600);
} 

void draw() {

  background(0);

  if (iteracion % 15 == 0) {
    m.setSize((int)random(10, 200), (int)random(10, 200));
  }

  m.setFill(200, 150, 40);
  m.setStroke(255, 255, 255);
  m.move(mouseX, mouseY);

  message.information("#" + iteracion);
  iteracion++;
}
