Movable movable;
Movable[] list;
Audio audio;

void setup() {

  size(800, 600);

  /* Audio */
  audio = new Audio("audio.mp3", this);

  /* Movable */
  movable = new Movable(Movable.Rect, 25, 25);
  movable.setFill(255, 0, 255);
  movable.setX(30);
  movable.setY(30);
  movable.setSpeedX(1);
  movable.setSpeedY(1);

  /* Lista */
  list = new Movable[5];

  for (int i = 0; i < 5; i++) {

    list[i] = new Movable(Movable.Rect, 50, 50);

    list[i].setFill(255, 255, 0);

    list[i].setX((int)random(50, 800));
    list[i].setY((int)random(50, 600));
  }

  return;
} 

void draw() {

  background(0);

  movable.move(mouseX, mouseY);

  for (int i = 0; i < 5; i++) {
    list[i].move();
  }

  if (movable.beside(list)) {
    movable.setFill(255, 0, 0);
    audio.play();
  } else {
    movable.setFill(255, 0, 255);
  }

  return;
}
