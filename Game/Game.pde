/* Imagen de fondo */
PImage backgroundImage = null;

/* Pacman */
Movable pacman = null;

/* Fantasmas */
Movable inky = null;
Movable blinky = null;
Movable pinky = null;
Movable clyde = null;

void setup() {

  /* Pantalla */
  size(800, 600);

  /* Asignamos el fondo */
  backgroundImage = loadImage("data/image/background/image.jpg");

  /* Instanciamos => Pacman */
  pacman = new Movable(Movable.Image, 32, 32);
  pacman.setImagePath("data/image/pacman/close.png");
  pacman.setSpeedX(3);
  pacman.setSpeedY(3);
  pacman.setX(400);
  pacman.setY(300);

  return;
} 

void draw() {

  background(backgroundImage);

  pacman.move(Movable.Down);

  return;
}
