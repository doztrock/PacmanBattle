Movable movable;
Movable point;

void setup() {

  size(800, 600);

  movable = new Movable(Movable.Rect, 10, 10);
  movable.setFill(255, 0, 255);
  movable.setX(30);
  movable.setY(30);
  movable.setSpeedX(1);
  movable.setSpeedY(1);

  point = new Movable(Movable.Rect, 50, 50);
  point.setFill(0, 255, 0);
  point.setX(400);
  point.setY(300);

  return;
} 

void draw() {

  background(0);
  point.move();
  movable.move(mouseX, mouseY);

  if (movable.beside(point)) {
    point.setFill(255, 255, 255);
  } else {
    point.setFill(0, 255, 0);
  }

  String mCadena = " X1: " + movable.getPositionElement().getX1() +
    " X2: " + movable.getPositionElement().getX2() +
    " Y1: " + movable.getPositionElement().getY1() +
    " Y2: " + movable.getPositionElement().getY2();

  String pCadena = " X1: " + point.getPositionElement().getX1() +
    " X2: " + point.getPositionElement().getX2() +
    " Y1: " + point.getPositionElement().getY1() +
    " Y2: " + point.getPositionElement().getY2();

  fill(255, 100, 100);
  text(mCadena, 550, 550);

  fill(255, 100, 100);
  text(pCadena, 550, 575);

  return;
}

void keyPressed() {

  if (key == CODED) {

    switch(keyCode) {

    case UP:
      movable.move(Movable.Up);
      break;

    case DOWN:
      movable.move(Movable.Down);
      break;

    case LEFT:
      movable.move(Movable.Left);
      break;

    case RIGHT:
      movable.move(Movable.Right);
      break;
    }
  } else {

    switch(key) {

    case '+':
      movable.setSpeedX(movable.getSpeedX() + 5);
      movable.setSpeedY(movable.getSpeedY() + 5);
      break;

    case '-':
      movable.setSpeedX(movable.getSpeedX() - 5);
      movable.setSpeedY(movable.getSpeedY() - 5);
      break;
    }
  }

  return;
}
