PositionRegistry positionRegistry;
Movable movable;

void setup() {

  size(800, 600);

  positionRegistry =  new PositionRegistry();

  movable = new Movable(Movable.Ellipse, 50, 50, positionRegistry);
  movable.setFill(255, 0, 255);
  movable.setX(400);
  movable.setY(300);

  return;
} 

void draw() {

  background(0);
  movable.move();

  return;
}

void keyPressed() {

  if (key == CODED) {

    switch(keyCode) {

    case UP:
      movable.move(movable.getX(), movable.getY() - 10);
      break;

    case DOWN:
      movable.move(movable.getX(), movable.getY() + 10);
      break;

    case LEFT:
      movable.move(movable.getX() - 10, movable.getY() );
      break;

    case RIGHT:
      movable.move(movable.getX() + 10, movable.getY());
      break;
    }

    return;
  } else {
  }

  return;
}
