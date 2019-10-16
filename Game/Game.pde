/* Fondo de pantalla */
PImage backgroundImage = null;

/* Pacman */
Movable pacman = null;

/* Fantasmas */
Movable blinky = null;
Movable clyde = null;
Movable inky = null;
Movable pinky = null;

/* Fantasma actual */
int currentGhost;

/* Listado de fantasmas */
Movable[] ghosts = null;

/* Administrador de serial */
SerialManager serialManager = null;

void setup() {

  /* Inicializacion: Pantalla */
  size(800, 600);

  /* Asignacion: Fondo de pantalla */
  backgroundImage = loadImage("data/image/background/image.jpg");

  /* Inicializacion: Administrador de serial */
  serialManager = new SerialManager(PacmanBattle.PORT, PacmanBattle.BAUD_RATE, this);

  /* Instanciacion: Pacman */
  pacman = new Movable(Movable.Image, 32, 32);
  pacman.setImagePath("data/image/pacman/close.png");
  pacman.setSpeedX(3);
  pacman.setSpeedY(3);
  pacman.setX(400);
  pacman.setY(300);

  /* Instanciacion: Blinky */
  blinky = new Movable(Movable.Rect, 32, 32);  
  blinky.setFill(155, 89, 182);
  blinky.setStroke(0, 0, 0, 1);
  blinky.setSpeedX(3);
  blinky.setSpeedY(3);
  blinky.setX(500);
  blinky.setY(500);

  /* Instanciacion: Clyde */
  clyde = new Movable(Movable.Rect, 32, 32);
  clyde.setFill(46, 204, 113);  
  clyde.setStroke(0, 0, 0, 1);  
  clyde.setSpeedX(3);
  clyde.setSpeedY(3);
  clyde.setX(250);
  clyde.setY(40);

  /* Instanciacion: Inky */
  inky = new Movable(Movable.Rect, 32, 32);  
  inky.setFill(230, 126, 34);
  inky.setStroke(0, 0, 0, 1);
  inky.setSpeedX(3);
  inky.setSpeedY(3);
  inky.setX(450);
  inky.setY(140);

  /* Instanciacion: Pinky */
  pinky = new Movable(Movable.Rect, 32, 32);  
  pinky.setFill(26, 188, 156);
  pinky.setStroke(0, 0, 0, 1);
  pinky.setSpeedX(3);
  pinky.setSpeedY(3);
  pinky.setX(40);
  pinky.setY(500);

  /* Almacenamiento: Listado de fantasmas */
  ghosts = new Movable[4];

  ghosts[0] = blinky;
  ghosts[1] = clyde;
  ghosts[2] = inky;
  ghosts[3] = pinky;

  /* Seleccion: Fantasma actual */
  currentGhost = round(random(0, 3));
  ghosts[currentGhost].setStroke(255, 255, 255, 5);

  return;
} 

void draw() {

  /* Dibujo: Fondo */
  background(backgroundImage);

  /* Aparicion: Pacman */
  pacman.move();

  /* Aparicion: Fantasmas extras */
  for (int indexGhost = 0; indexGhost < ghosts.length; indexGhost++) {
    if (indexGhost != currentGhost) {
      ghosts[indexGhost].move();
    }
  }

  /* Aparicion: Fantasma actual */
  ghosts[currentGhost].move();

  /* Lectura: Administrador de serial */
  char readingSerialManager = serialManager.read();

  switch(readingSerialManager) {

  case PacmanBattle.LEFT_CONTROL_1:
    pacman.move(Movable.Left);
    break;

  case PacmanBattle.LEFT_CONTROL_2:
    //currentGhost.move(Movable.Left);
    switchGhost(ghosts);
    break;

  case PacmanBattle.UP_CONTROL_1:
    pacman.move(Movable.Up);
    break;

  case PacmanBattle.UP_CONTROL_2:
    ghosts[currentGhost].move(Movable.Up);
    break;

  case PacmanBattle.DOWN_CONTROL_1:
    pacman.move(Movable.Down);
    break;

  case PacmanBattle.DOWN_CONTROL_2:
    ghosts[currentGhost].move(Movable.Down);
    break;

  case PacmanBattle.RIGHT_CONTROL_1:
    pacman.move(Movable.Right);
    break;

  case PacmanBattle.RIGHT_CONTROL_2:
    ghosts[currentGhost].move(Movable.Right);
    break;

  default:
    break;
  }

  return;
}

void switchGhost(Movable[] list) {

  // Restauracion de color
  for (Movable ghost : list) {
    ghost.setStroke(0, 0, 0, 1);
  }

  // Cambio de fantasma
  currentGhost = round(random(0, 3));
  ghosts[currentGhost].setStroke(255, 255, 255, 5);

  return;
}
