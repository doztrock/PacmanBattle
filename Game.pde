PositionRegistry positionRegistry;
Movable movable;
Audio audio;

void setup() {

  size(800, 600);

  positionRegistry =  new PositionRegistry();

  audio = new Audio("audio.mp3", this);

  movable = new Movable(Movable.Rect, 50, 50, positionRegistry);
  movable.setFill(255, 0, 255);
  movable.setX(400);
  movable.setY(300);

  return;
} 

void draw() {

  background(0);
  movable.move();

  if (keyPressed) {
    audio.play();
  }

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
