/* Declaracion: Fondo */
PImage maze = null;

/* Declaracion: Pacman */
Movable pacman = null;

/* Declaracion: Personajes */
Movable blinky = null;
Movable clyde = null;
Movable inky = null;
Movable pinky = null;

/* Declaracion: Listado de personajes */
Movable[] ghost = null;

/* Declaracion: Personaje actual */
int current;

void setup() {

  /* Inicializacion: Pantalla */
  size(800, 600);

  /* Inicializacion: Fondo */
  maze = loadImage("data/image/background/maze.png");

  /* Inicializacion: Pacman */
  pacman = new Movable(Movable.Image, 32, 32);
  pacman.setImagePath("data/image/pacman/close.png");
  pacman.setSpeedX(3);
  pacman.setSpeedY(3);
  pacman.setX(400);
  pacman.setY(300);

  /* Inicializacion: Blinky */
  blinky = new Movable(Movable.Rect, 32, 32);  
  blinky.setFill(155, 89, 182);
  blinky.setStroke(0, 0, 0, 1);
  blinky.setSpeedX(3);
  blinky.setSpeedY(3);
  blinky.setX(500);
  blinky.setY(500);

  /* Inicializacion: Clyde */
  clyde = new Movable(Movable.Rect, 32, 32);
  clyde.setFill(46, 204, 113);  
  clyde.setStroke(0, 0, 0, 1);  
  clyde.setSpeedX(3);
  clyde.setSpeedY(3);
  clyde.setX(250);
  clyde.setY(40);

  /* Inicializacion: Inky */
  inky = new Movable(Movable.Rect, 32, 32);  
  inky.setFill(230, 126, 34);
  inky.setStroke(0, 0, 0, 1);
  inky.setSpeedX(3);
  inky.setSpeedY(3);
  inky.setX(450);
  inky.setY(140);

  /* Inicializacion: Pinky */
  pinky = new Movable(Movable.Rect, 32, 32);  
  pinky.setFill(26, 188, 156);
  pinky.setStroke(0, 0, 0, 1);
  pinky.setSpeedX(3);
  pinky.setSpeedY(3);
  pinky.setX(40);
  pinky.setY(500);

  /* Inicializacion: Listado de personajes */
  ghost = new Movable[4];

  /* Almacenamiento: Listado de personajes */
  ghost[0] = blinky;
  ghost[1] = clyde;
  ghost[2] = inky;
  ghost[3] = pinky;

  /* Asignacion: Personaje actual */
  current = round(random(0, 3));
  ghost[current].setStroke(255, 255, 255, 5);

  return;
} 

void draw() {

  /* Aparicion: Fondo */
  background(maze);

  /* Aparicion: Pacman */
  pacman.move();

  /* Aparicion: Personajes */
  for (int index = 0; index < ghost.length; index++) {
    if (index != current) {
      ghost[index].move();
    }
  }

  /* Aparicion: Personaje actual */
  ghost[current].move();

  return;
}

void switchGhost(Movable[] list) {

  /* Reasignacion: Color de personajes */
  for (Movable ghost : list) {
    ghost.setStroke(0, 0, 0, 1);
  }

  /* Reasignacion: Personaje actual */
  current = round(random(0, 3));
  ghost[current].setStroke(255, 255, 255, 5);

  return;
}
