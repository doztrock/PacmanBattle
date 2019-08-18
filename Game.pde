PositionRegistry positionRegistry;
Movable movable1;
Movable movable2;

void setup() {

  size(800, 600);

  positionRegistry =  new PositionRegistry();

  movable1 = new Movable(ShapeType.Ellipse, 50, 50, positionRegistry);
  movable1.setFill(255, 0, 255);

  movable2 = new Movable(ShapeType.Rect, 70, 90, positionRegistry);
  movable2.setFill(255, 255, 0);

  return;
} 

void draw() {
  background(0);

  movable1.move(mouseX, mouseY);
  movable2.move(400, 200);

  for (RegistryElement e : positionRegistry.getRegistry()) {
    println(e.getX1(), e.getX2(), e.getY1(), e.getY2());
  }


  return;
}
