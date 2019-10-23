/* Declaracion: Plantilla */
PImage template = null;

/* Declaracion: Laberinto */
Movable[] maze;

/* Declaracion: Fuente */
PFont font = null;

/* Declaracion: Barra => Jugador 1 */
ProgressBar progressBarOne = null;

/* Declaracion: Barra => Jugador 2 */
ProgressBar progressBarTwo = null;

/* Declaracion: Personajes */
Movable[] character;

/* Declaracion: Personaje actual */
int currentCharacter;

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
    new Movable(Movable.Rect, 11, 80).setFill(246, 185, 59).setStroke(255, 255, 255, 0).setX(473).setY(443), 

    // ZONAS

    new Movable(Movable.Rect, 147, 134).setFill(19, 15, 64).setStroke(255, 255, 255, 0).setX(326).setY(237), 
    new Movable(Movable.Rect, 77, 64).setFill(240, 147, 43).setStroke(255, 255, 255, 0).setX(707).setY(93) 

  };

  /* Inicializacion: Fuente */
  font = createFont("font/font.ttf", 22);
  textFont(font);

  /* Inicializacion: Barra => Jugador 1 */
  progressBarOne =  new ProgressBar(55, 30, 250, 25);

  /* Inicializacion: Barra => Jugador 2 */
  progressBarTwo =  new ProgressBar(545, 30, 250, 25);

  /* Inicializacion: Personajes */
  character = new Movable[]{

    // BLINKY
    new Movable(Movable.Rect, 32, 32).setFill(186, 220, 88).setStroke(0, 0, 0, 1).setSpeedX(3).setSpeedY(3).setX(350).setY(255), 

    // CLYDE
    new Movable(Movable.Rect, 32, 32).setFill(224, 86, 253).setStroke(0, 0, 0, 1).setSpeedX(3).setSpeedY(3).setX(350).setY(320), 

    // INKY
    new Movable(Movable.Rect, 32, 32).setFill(126, 214, 223).setStroke(0, 0, 0, 1).setSpeedX(3).setSpeedY(3).setX(420).setY(255), 

    // PINKY
    new Movable(Movable.Rect, 32, 32).setFill(255, 121, 121).setStroke(0, 0, 0, 1).setSpeedX(3).setSpeedY(3).setX(420).setY(320)

  };

  /* Inicializacion: Personaje actual */
  currentCharacter = round(random(0, 3));
  character[currentCharacter].setStroke(255, 255, 255, 3);

  return;
}

void draw() {

  /* Aparicion: Plantilla */
  background(template);

  /* Aparicion: Laberinto */
  for (Movable wall : maze) {
    wall.move();
  }

  /* Aparicion: Barra => Jugador 1 */
  fill(255);
  text("P1", 5, 54);
  progressBarOne.show(53, 59, 72, 232, 65, 24);

  /* Aparicion: Barra => Jugador 2 */
  fill(255);
  text("P2", 495, 54);
  progressBarTwo.show(53, 59, 72, 0, 151, 230);

  /* Aparicion: Personajes */
  int counter = 0;

  for (Movable ghost : character) {

    if (counter != currentCharacter) {    
      ghost.move();
    }

    counter++;
  }

  /* Aparicion: Personaje actual */
  character[currentCharacter].move();

  return;
}

void switchGhost() {

  /* Reasignacion: Color de personajes */
  for (Movable ghost : character) {
    ghost.setStroke(0, 0, 0, 1);
  }

  /* Reasignacion: Personaje actual */
  currentCharacter = round(random(0, 3));
  character[currentCharacter].setStroke(255, 255, 255, 5);

  return;
}
