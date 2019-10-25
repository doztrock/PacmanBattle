/* Declaracion: Plantilla */
PImage template;

/* Declaracion: Laberinto */
Movable[] maze;

/* Declaracion: Zona de personajes */
Movable zoneCharacter;

/* Declaracion: Zona de protagonista */
Movable zoneMainCharacter;

/* Declaracion: Fuente */
PFont font;

/* Declaracion: Barra => Jugador 1 */
ProgressBar progressBarOne;

/* Declaracion: Barra => Jugador 2 */
ProgressBar progressBarTwo;

/* Declaracion: Protagonista */
Movable mainCharacter;

/* Declaracion: Personajes */
Movable[] character;

/* Declaracion: Direcciones */
int[] direction;

/* Declaracion: Direccion de protagonista */
int directionMainCharacter;

/* Declaracion: Direcciones de personajes */
int[] directionCharacter;

/* Declaracion: Posicion segura de protagonista */
int safeXMainCharacter;
int safeYMainCharacter;

/* Declaracion: Posiciones seguras de personajes */
int[] safeXCharacter;
int[] safeYCharacter;

/* Declaracion: Personaje actual */
int currentCharacter;

/* Declaracion: Audios */
Audio intro;
Audio loop;

void setup() {

  /* Inicializacion: Pantalla */
  size(800, 600);

  /* Inicializacion: Plantilla */
  template = loadImage("data/image/background/maze.png");

  /* Inicializacion: Laberinto */
  maze = new Movable[]{

    // CONTORNO

    new Movable(Movable.Rect, 11, 509).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(4).setY(84), 
    new Movable(Movable.Rect, 791, 11).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(4).setY(84), 
    new Movable(Movable.Rect, 11, 509).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(784).setY(84), 
    new Movable(Movable.Rect, 791, 11).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(4).setY(584), 

    // HORIZONTALES

    new Movable(Movable.Rect, 87, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(83).setY(157), 
    new Movable(Movable.Rect, 165, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(239).setY(157), 
    new Movable(Movable.Rect, 88, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(551).setY(157), 

    new Movable(Movable.Rect, 401, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(83).setY(227), 

    new Movable(Movable.Rect, 166, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(83).setY(299), 
    new Movable(Movable.Rect, 165, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(551).setY(299), 

    new Movable(Movable.Rect, 87, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(83).setY(371), 
    new Movable(Movable.Rect, 164, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(239).setY(371), 
    new Movable(Movable.Rect, 88, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(628).setY(371), 

    new Movable(Movable.Rect, 89, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(160).setY(442), 
    new Movable(Movable.Rect, 167, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(473).setY(442), 

    new Movable(Movable.Rect, 164, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(239).setY(514), 
    new Movable(Movable.Rect, 165, 10).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(551).setY(514), 

    // VERTICALES

    new Movable(Movable.Rect, 11, 143).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(628).setY(94), 

    new Movable(Movable.Rect, 11, 81).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(707).setY(157), 
    new Movable(Movable.Rect, 11, 80).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(83).setY(157), 

    new Movable(Movable.Rect, 11, 152).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(315).setY(228), 
    new Movable(Movable.Rect, 11, 143).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(473).setY(228), 
    new Movable(Movable.Rect, 11, 153).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(551).setY(228), 

    new Movable(Movable.Rect, 11, 225).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(707).setY(299), 

    new Movable(Movable.Rect, 11, 152).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(83).setY(371), 
    new Movable(Movable.Rect, 11, 80).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(396).setY(371), 

    new Movable(Movable.Rect, 11, 151).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(160).setY(444), 

    new Movable(Movable.Rect, 11, 80).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(315).setY(443), 
    new Movable(Movable.Rect, 11, 80).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(473).setY(443) 

  };

  /* Inicializacion: Zona de personajes */
  zoneCharacter = new Movable(Movable.Rect, 147, 134).setFill(19, 15, 64).setStroke(255, 255, 255, 1).setX(326).setY(237);

  /* Inicializacion: Zona de protagonista */
  zoneMainCharacter = new Movable(Movable.Rect, 77, 64).setFill(76, 209, 55).setStroke(255, 255, 255, 1).setX(707).setY(93);

  /* Inicializacion: Fuente */
  font = createFont("font/font.ttf", 22);
  textFont(font);

  /* Inicializacion: Barra => Jugador 1 */
  progressBarOne =  new ProgressBar(55, 30, 250, 25);

  /* Inicializacion: Barra => Jugador 2 */
  progressBarTwo =  new ProgressBar(545, 30, 250, 25);

  /* Inicializacion: Protagonista */
  mainCharacter = new Movable(Movable.Rect, 35, 35).setFill(255, 211, 42).setStroke(0, 0, 0, 0).setSpeedX(4).setSpeedY(5).setX(100).setY(100);

  /* Inicializacion: Personajes */
  character = new Movable[]{

    // BLINKY
    new Movable(Movable.Rect, 32, 32).setFill(186, 220, 88).setStroke(0, 0, 0, 1).setSpeedX(5).setSpeedY(5).setX(350).setY(255), 

    // CLYDE
    new Movable(Movable.Rect, 32, 32).setFill(224, 86, 253).setStroke(0, 0, 0, 1).setSpeedX(3).setSpeedY(3).setX(350).setY(320), 

    // INKY
    new Movable(Movable.Rect, 32, 32).setFill(126, 214, 223).setStroke(0, 0, 0, 1).setSpeedX(4).setSpeedY(4).setX(420).setY(255), 

    // PINKY
    new Movable(Movable.Rect, 32, 32).setFill(255, 121, 121).setStroke(0, 0, 0, 1).setSpeedX(3).setSpeedY(3).setX(420).setY(320)

  };

  /* Inicializacion: Direcciones */
  direction = new int[]{
    Movable.Up, 
    Movable.Down, 
    Movable.Left, 
    Movable.Right
  };

  /* Inicializacion: Direccion de protagonista */
  directionMainCharacter = Movable.None;

  /* Inicializacion: Direcciones de personajes */
  directionCharacter = new int[]{
    direction[round(random(0, (direction.length - 1)))], 
    direction[round(random(0, (direction.length - 1)))], 
    direction[round(random(0, (direction.length - 1)))], 
    direction[round(random(0, (direction.length - 1)))]
  };

  /* Inicializacion: Posicion segura de protagonista */
  safeXMainCharacter = 0;
  safeYMainCharacter = 0;

  /* Inicializacion: Posiciones seguras de personajes */
  safeXCharacter = new int[]{
    0, 0, 0, 0
  };

  safeYCharacter = new int[]{
    0, 0, 0, 0
  };

  /* Inicializacion: Personaje actual */
  currentCharacter = round(random(0, (character.length - 1)));
  character[currentCharacter].setStroke(255, 255, 255, 3);
  directionCharacter[currentCharacter] = Movable.None;

  /* Inicializacion: Audios */
  intro = new Audio("audio/intro.mp3", Audio.Normal, this);
  loop = new Audio("audio/loop.mp3", Audio.Loop, this);

  return;
}

void draw() {

  /* Aparicion: Plantilla */
  background(template);

  /* Aparicion: Laberinto */
  for (Movable wall : maze) {
    wall.move();
  }

  /* Aparicion: Zona de personajes */
  zoneCharacter.move();

  /* Aparicion: Zona de protagonista */
  zoneMainCharacter.move();

  /* Aparicion: Barra => Jugador 1 */
  fill(255);
  text("P1", 5, 54);
  progressBarOne.show(53, 59, 72, 232, 65, 24);

  /* Aparicion: Barra => Jugador 2 */
  fill(255);
  text("P2", 495, 54);
  progressBarTwo.show(53, 59, 72, 0, 151, 230);

  /* Aparicion: Protagonista */
  mainCharacter.move(directionMainCharacter);

  if (mainCharacter.beside(maze) && (safeXMainCharacter > 0 && safeYMainCharacter > 0)) {
    mainCharacter.setX(safeXMainCharacter);
    mainCharacter.setY(safeYMainCharacter);
    directionMainCharacter = Movable.None;
  }

  if (!mainCharacter.beside(maze)) {
    safeXMainCharacter = mainCharacter.getX();
    safeYMainCharacter = mainCharacter.getY();
  }

  /* Aparicion: Personajes */
  int index = 0;

  for (Movable ghost : character) {

    if (index != currentCharacter) {    

      ghost.move(directionCharacter[index]);

      if (ghost.beside(maze) && (safeXCharacter[index] > 0 && safeYCharacter[index] > 0)) {
        ghost.setX(safeXCharacter[index]);
        ghost.setY(safeYCharacter[index]);
        directionCharacter[index] = direction[round(random(0, (direction.length - 1)))];
      }

      if (!ghost.beside(maze)) {
        safeXCharacter[index] = ghost.getX();
        safeYCharacter[index] = ghost.getY();
      }

      if (directionCharacter[index] == Movable.None) {
        directionCharacter[index] = direction[round(random(0, (direction.length - 1)))];
      }
    }

    index++;
  }

  /* Aparicion: Personaje actual */
  character[currentCharacter].move(directionCharacter[currentCharacter]);

  if (character[currentCharacter].beside(maze) && (safeXCharacter[currentCharacter] > 0 && safeYCharacter[currentCharacter] > 0)) {
    character[currentCharacter].setX(safeXCharacter[currentCharacter]);
    character[currentCharacter].setY(safeYCharacter[currentCharacter]);
    directionCharacter[currentCharacter] = Movable.None;
  }

  if (!character[currentCharacter].beside(maze)) {
    safeXCharacter[currentCharacter] = character[currentCharacter].getX();
    safeYCharacter[currentCharacter] = character[currentCharacter].getY();
  }

  /* Reproduccion: Audio (intro & loop) */
  intro.play();

  if (!intro.running()) {
    loop.play();
  }

  return;
}

void keyPressed() {

  switch(key) {
  case 'i':
    directionMainCharacter = Movable.Up;
    break;

  case 'k':
    directionMainCharacter = Movable.Down;
    break;

  case 'j':
    directionMainCharacter = Movable.Left;
    break;

  case 'l':
    directionMainCharacter = Movable.Right;
    break;

  case 'w':
    directionCharacter[currentCharacter] = Movable.Up;
    break;

  case 's':
    directionCharacter[currentCharacter] = Movable.Down;
    break;

  case 'a':
    directionCharacter[currentCharacter] = Movable.Left;
    break;

  case 'd':
    directionCharacter[currentCharacter] = Movable.Right;
    break;

  case 'q':
    switchGhost();
    break;

  default:
    break;
  }

  return;
}

void switchGhost() {

  /* Reasignacion: Color de personajes */
  for (Movable ghost : character) {
    ghost.setStroke(0, 0, 0, 1);
  }

  /* Generacion: Numero aleatorio */
  int randomNumber;

  do {
    randomNumber = round(random(0, (character.length - 1)));
  } while (randomNumber == currentCharacter);

  /* Reasignacion: Personaje actual */
  currentCharacter = randomNumber;
  character[currentCharacter].setStroke(255, 255, 255, 3);
  directionCharacter[currentCharacter] = Movable.None;

  return;
}
