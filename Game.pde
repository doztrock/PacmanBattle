Message message = new Message();
Movable m = new Movable();

void setup() {
  size(800, 600);
} 

void draw() {
  background(0);

  m.setFill(200, 150, 40);
  m.setStroke(255, 255, 255);
  m.move(mouseX, mouseY);
}
