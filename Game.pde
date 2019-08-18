PositionRegistry positionRegistry;
Movable movable1;
Movable movable2;
Movable movable3;

void setup() {

  size(800, 600);

  positionRegistry =  new PositionRegistry();

  movable1 = new Movable(Movable.Ellipse, 50, 50, positionRegistry);
  movable1.setFill(255, 0, 255);

  movable2 = new Movable(Movable.Rect, 70, 90, positionRegistry);
  movable2.setFill(255, 255, 0);

  movable3 = new Movable(Movable.Image, 64, 64, positionRegistry);
  movable3.setImageName("cat.png");

  return;
} 

void draw() {

  background(0);

  movable1.move(70, mouseY);
  movable2.move(mouseX, 200);
  movable3.move(mouseX, mouseY);

  for (RegistryElement e : positionRegistry.getRegistry()) {
    println(e.getX1(), e.getX2(), e.getY1(), e.getY2());
  }


  return;
}
