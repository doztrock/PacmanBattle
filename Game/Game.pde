/**
 * SERIAL
 */

/** 
 * Declaracion: Manager 
 */
SerialManager serialManager;

/**
 * ELEMENTOS DE JUEGO
 */

/** 
 * Declaracion: Menu de inicio 
 */
Movable[] startMenu;

/** 
 * Declaracion: Opcion actual de menu de inicio
 */
int currentStartMenuOption;

/** 
 * Declaracion: Duracion del juego actual
 */
int gameCurrentDuration;

/** 
 * Declaracion: Duracion del juego
 */
int gameDuration;

/** 
 * Declaracion: Bandera => Juego iniciado
 */
boolean gameStarted;

/** 
 * Declaracion: Bandera => Juego finalizado
 */
boolean gameFinalized;

/**
 * Declaracion: Plantilla 
 */
PImage template;

/**
 * Declaracion: Fuente 
 */
PFont font;

/**
 * Declaracion: Laberinto 
 */
Movable[] maze;

/**
 * Declaracion: Direcciones soportadas 
 */
int[] direction;


/**
 * BARRAS DE PROGRESO
 */

/**
 * Declaracion: Barra => Jugador 1
 */
ProgressBar progressBarOne;

/**
 * Declaracion: Barra => Jugador 2
 */
ProgressBar progressBarTwo;


/**
 * AUDIOS
 */

/**
 * Declaracion: Audio de introduccion
 */
Audio intro;

/**
 * Declaracion: Audio de juego
 */
Audio loop;

/**
 * Declaracion: Audio de mordisco (Protagonista) 
 */
Audio mainPop;

/**
 * Declaracion: Audio de mordisco (Personaje)
 */
Audio characterPop;

/**
 * Declaracion: Audio de seleccion en menu principal
 */
Audio beep;

/**
 * Declaracion: Audio de disparo (Protagonista)
 */
Audio mainShoot;

/**
 * Declaracion: Audio de disparo (Personaje)
 */
Audio characterShoot;

/**
 * Declaracion: Audio de desvanecimiento
 */
Audio disappear;


/**
 * PROTAGONISTA
 */

/**
 * Declaracion: Protagonista 
 */
Movable mainCharacter;

/**
 * Declaracion: Direccion de protagonista 
 */
int directionMainCharacter;

/**
 * Declaracion: Zona de protagonista 
 */
Movable zoneMainCharacter;

/**
 * Declaracion: Posicion segura de protagonista 
 */
int safeXMainCharacter;
int safeYMainCharacter;

/**
 * Declaracion: Disparos de protagonista 
 */
ArrayList<Movable> shootMainCharacter;

/**
 * Declaracion: Contador de disparos en protagonista 
 */
int shootMainCharacterCounter;

/**
 * Declaracion: Puntaje de protagonista 
 */
int scoreMainCharacter;


/**
 * PERSONAJES
 */

/**
 * Declaracion: Personajes
 */
Movable[] character;

/**
 * Declaracion: Direcciones de personajes 
 */
int[] directionCharacter;

/**
 * Declaracion: Zona de personajes 
 */
Movable zoneCharacter;

/* Declaracion: Posiciones seguras de personajes */
int[] safeXCharacter;
int[] safeYCharacter;

/**
 * Declaracion: Disparos de personajes 
 */
ArrayList<Movable> shootCharacter;

/**
 * Declaracion: Contador de disparos en personajes 
 */
int[] shootCharacterCounter;

/**
 * Declaracion: Puntaje de personajes 
 */
int scoreCharacter;

/**
 * Declaracion: Personaje actual 
 */
int currentCharacter;


/**
 * MORAS
 */

/**
 * Declaracion: Moras 
 */
ArrayList<Movable> strawberry;


void setup() {

  /**
   * SERIAL
   */
  
  /** 
   * Declaracion: Manager 
   */
  if(PacmanBattle.PLATFORM == PacmanBattle.ARDUINO){
    serialManager = new SerialManager(PacmanBattle.PORT, PacmanBattle.BAUD_RATE, this);
  }
  
  
  /**
   * ELEMENTOS DE JUEGO
   */

  /**
   * Inicializacion: Pantalla 
   */
  size(800, 600);

  /** 
   * Inicializacion: Menu de inicio 
   */
  startMenu = new Movable[]{

    // OPCION: 1 MINUTO
    new Movable(Movable.Rect, 100, 50).setID(0).setFill(0, 168, 255).setStroke(255, 255, 255, 0).setX(200).setY(200), 

    // OPCION: 3 MINUTOS
    new Movable(Movable.Rect, 100, 50).setID(1).setFill(0, 168, 255).setStroke(255, 255, 255, 0).setX(350).setY(200), 

    // OPCION: 5 MINUTOS
    new Movable(Movable.Rect, 100, 50).setID(2).setFill(0, 168, 255).setStroke(255, 255, 255, 0).setX(500).setY(200)

  };

  /** 
   * Inicializacion: Opcion actual de menu de inicio
   */
  currentStartMenuOption = 0;

  /** 
   * Inicializacion: Duracion del juego actual
   */
  gameCurrentDuration = 0;

  /** 
   * Inicializacion: Duracion del juego
   */
  gameDuration = 0;

  /** 
   * Inicializacion: Bandera => Juego iniciado
   */
  gameStarted = false;
  
  /** 
   * Inicializacion: Bandera => Juego finalizado
   */
  gameFinalized = false;

  /**
   * Inicializacion: Plantilla
   */
  template = loadImage("data/image/background/maze.png");

  /** 
   * Inicializacion: Fuente 
   */
  font = createFont("font/font.ttf", 22);
  textFont(font);

  /** 
   * Inicializacion: Laberinto 
   */
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

  /**
   * Inicializacion: Direcciones soportadas 
   */
  direction = new int[]{
    Movable.Up, 
    Movable.Down, 
    Movable.Left, 
    Movable.Right
  };


  /**
   * BARRAS DE PROGRESO
   */

  /**
   * Inicializacion: Barra => Jugador 1 
   */
  progressBarOne =  new ProgressBar(55, 51, 250, 25);

  /**
   * Inicializacion: Barra => Jugador 2
   */
  progressBarTwo =  new ProgressBar(545, 51, 250, 25);


  /**
   * AUDIOS
   */

  /**
   * Inicializacion: Audio de introduccion
   */
  intro = new Audio("audio/intro.mp3", Audio.Once, this);

  /**
   * Inicializacion: Audio de juego
   */
  loop = new Audio("audio/loop.mp3", Audio.Loop, this);

  /**
   * Inicializacion: Audio de mordisco (Protagonista)
   */
  mainPop = new Audio("audio/mainPop.mp3", Audio.Multiple, this);

  /**
   * Inicializacion: Audio de mordisco (Personaje)
   */
  characterPop = new Audio("audio/characterPop.mp3", Audio.Multiple, this);

  /**
   * Inicializacion: Audio de seleccion en menu principal
   */
  beep = new Audio("audio/beep.mp3", Audio.Multiple, this);

  /**
   * Inicializacion: Audio de disparo (Protagonista)
   */
  mainShoot = new Audio("audio/mainShoot.mp3", Audio.Multiple, this);

  /**
   * Inicializacion: Audio de disparo (Personaje)
   */
  characterShoot = new Audio("audio/characterShoot.mp3", Audio.Multiple, this);

  /**
   * Declaracion: Audio de desvanecimiento
   */
  disappear = new Audio("audio/disappear.mp3", Audio.Multiple, this);


  /**
   * PROTAGONISTA
   */

  /**
   * Inicializacion: Protagonista 
   */
  mainCharacter = new Movable(Movable.Rect, 35, 35).setFill(255, 211, 42).setStroke(232, 65, 24, 3).setSpeedX(4).setSpeedY(5).setX(729).setY(105);

  /**
   * Inicializacion: Direccion de protagonista 
   */
  directionMainCharacter = Movable.None;

  /**
   * Inicializacion: Zona de protagonista 
   */
  zoneMainCharacter = new Movable(Movable.Rect, 77, 64).setFill(76, 209, 55).setStroke(255, 255, 255, 1).setX(707).setY(93);

  /**
   * Inicializacion: Posicion segura de protagonista 
   */
  safeXMainCharacter = 0;
  safeYMainCharacter = 0;

  /**
   * Inicializacion: Disparos de protagonista 
   */
  shootMainCharacter = new ArrayList<Movable>();

  /**
   * Inicializacion: Contador de disparos en protagonista 
   */
  shootMainCharacterCounter = 0;

  /**
   * Inicializacion: Puntaje de protagonista 
   */
  scoreMainCharacter = 0;


  /**
   * PERSONAJES
   */

  /**
   * Inicializacion: Personajes 
   */
  character = new Movable[]{

    // BLINKY
    new Movable(Movable.Rect, 32, 32).setID(0).setFill(186, 220, 88).setStroke(0, 0, 0, 1).setSpeedX(5).setSpeedY(5).setX(350).setY(255), 

    // CLYDE
    new Movable(Movable.Rect, 32, 32).setID(1).setFill(224, 86, 253).setStroke(0, 0, 0, 1).setSpeedX(3).setSpeedY(3).setX(350).setY(320), 

    // INKY
    new Movable(Movable.Rect, 32, 32).setID(2).setFill(126, 214, 223).setStroke(0, 0, 0, 1).setSpeedX(4).setSpeedY(4).setX(420).setY(255), 

    // PINKY
    new Movable(Movable.Rect, 32, 32).setID(3).setFill(255, 121, 121).setStroke(0, 0, 0, 1).setSpeedX(3).setSpeedY(3).setX(420).setY(320)

  };

  /**
   * Inicializacion: Direcciones de personajes 
   */
  directionCharacter = new int[]{
    direction[round(random(0, (direction.length - 1)))], 
    direction[round(random(0, (direction.length - 1)))], 
    direction[round(random(0, (direction.length - 1)))], 
    direction[round(random(0, (direction.length - 1)))]
  };

  /**
   * Inicializacion: Zona de personajes 
   */
  zoneCharacter = new Movable(Movable.Rect, 147, 134).setFill(19, 15, 64).setStroke(255, 255, 255, 1).setX(326).setY(237);

  /**
   * Inicializacion: Posiciones seguras de personajes 
   */
  safeXCharacter = new int[]{
    0, 0, 0, 0
  };

  safeYCharacter = new int[]{
    0, 0, 0, 0
  };

  /**
   * Inicializacion: Disparos de personajes 
   */
  shootCharacter = new ArrayList<Movable>();

  /**
   * Inicializacion: Contador de disparos en personajes 
   */
  shootCharacterCounter = new int[]{
    0, 0, 0, 0
  };

  /**
   * Inicializacion: Puntaje de personajes 
   */
  scoreCharacter = 0;

  /**
   * Inicializacion: Personaje actual 
   */
  currentCharacter = round(random(0, (character.length - 1)));
  character[currentCharacter].setStroke(0, 151, 230, 3);
  directionCharacter[currentCharacter] = Movable.None;


  /**
   * MORAS
  */

  /**
   * Inicializacion: Moras 
   */
  strawberry = new ArrayList<Movable>();
  loadStrawberry();

  return;
}

void draw() {
 
  /**
   * ELEMENTOS DE JUEGO
   */

  /**
   * Aparicion: Final
   */
  if(gameFinalized == true){
    
    loop.stop();
    
    background(0);

    fill(255);
    text("FINAL DEL JUEGO", 235, 150);

    if(scoreMainCharacter > scoreCharacter){
      fill(255);
      text("JUGADOR 1 GANA", 235, 250);
    }else{
      fill(255);
      text("JUGADOR 2 GANA", 235, 250);
    }
    
    return;
  }

  /**
   * Aparicion: Menu de inicio
   */
  if(gameStarted == false){

    background(0);

    fill(255);
    text("Seleccione duracion del juego", 83, 150);

    for(Movable option : startMenu){

      if(option.getID() == currentStartMenuOption){
        option.setStroke(255, 255, 255, 5);
        option.move();
      }else{
        option.setStroke(255, 255, 255, 0);
        option.move();
      }

      switch(option.getID()){
      
        case 0:
          fill(255);
          text("1M", 228, 236);
          break;
        
        case 1:
          fill(255);
          text("3M", 378, 236);
          break;
        
        case 2:
          fill(255);
          text("5M", 528, 236);
          break;
      
      }

    }

    return;
  }

  /**
   * Aparicion: Plantilla 
   */
  background(template);

  /**
   * Aparicion: Laberinto 
   */
  for (Movable wall : maze) {
    wall.move();
  }


  /**
   * BARRAS DE PROGRESO
   */

  /**
   * Aparicion: Barra => Jugador 1 
   */
  fill(255);
  text(str(scoreMainCharacter), 55, 45);
  text("P1", 5, 75);
  progressBarOne.show(53, 59, 72, 232, 65, 24);

  if (progressBarOne.getProgress() == ProgressBar.MAX_PROGRESS) {
    progressBarOne.show(53, 59, 72, 11, 232, 129);
  }

  /**
   * Aparicion: Barra => Jugador 2 
   */
  fill(255);
  text(str(scoreCharacter), 545, 45);
  text("P2", 495, 75);
  progressBarTwo.show(53, 59, 72, 0, 151, 230);

  if (progressBarTwo.getProgress() == ProgressBar.MAX_PROGRESS) {
    progressBarTwo.show(53, 59, 72, 11, 232, 129);
  }


  /**
   * RELOJ
   */
   
  /**
   * Aparicion: Reloj 
   */
  fill(255);
  text(convertDuration(gameCurrentDuration), 350, 30);
   

  /**
   * AUDIOS
   */

  /** 
   * Reproduccion: Audio de introduccion
   */
  intro.play();

  /** 
   * Reproduccion: Audio de juego
   */
  if (!intro.running())   {
    loop.play();
  }


  /** 
   * ZONAS 
   */

  /**
   * Aparicion: Zona de personajes 
   */
  zoneCharacter.move();

  /**
   * Aparicion: Zona de protagonista 
   s*/
  zoneMainCharacter.move();


  /** 
   * MORAS 
   */

  /**
   * Aparicion: Moras 
   */
  for (Movable fruit : strawberry) {

    fruit.move();

    // Deteccion: Choque (Mora <=> Protagonista)
    if (fruit.beside(mainCharacter) && progressBarOne.getProgress() < ProgressBar.MAX_PROGRESS) {

      fruit.setX(-fruit.getX()).setY(-fruit.getY());
      progressBarOne.setProgress(progressBarOne.getProgress() + 4);
      mainPop.play();

    }

    // Deteccion: Choque (Mora <=> Personaje actual)
    if (fruit.beside(character[currentCharacter]) && progressBarTwo.getProgress() < ProgressBar.MAX_PROGRESS) {
      
      fruit.setX(-fruit.getX()).setY(-fruit.getY());
      progressBarTwo.setProgress(progressBarTwo.getProgress() + 4);
      characterPop.play();

    }

  }


  /** 
   * PROTAGONISTA 
   */

  /**
   * Desaparicion: Protagonista 
   */
  if(shootMainCharacterCounter >= 5){

    disappear.play();

    if(PacmanBattle.PLATFORM == PacmanBattle.ARDUINO){
      serialManager.write(PacmanBattle.VIBRATE_CONTROL_1);
    }

    mainCharacter.setX(729).setY(105);
    shootMainCharacterCounter = 0;
    directionMainCharacter = Movable.None;

  }

  /**
   * Aparicion: Protagonista 
   */
  mainCharacter.move(directionMainCharacter);

  /**
   * Deteccion: Choque (Protagonista <=> Laberinto || Protagonista <=> Zona de personajes) 
   */
  if ((mainCharacter.beside(maze) || mainCharacter.beside(zoneCharacter)) && (safeXMainCharacter > 0 && safeYMainCharacter > 0)) {
    mainCharacter.setX(safeXMainCharacter);
    mainCharacter.setY(safeYMainCharacter);
    directionMainCharacter = Movable.None;
  }

  /** 
   * Deteccion: NoChoque (Protagonista <=> Laberinto || Protagonista <=> Zona de personajes) 
   */
  if (!mainCharacter.beside(maze) || !mainCharacter.beside(zoneCharacter)) {
    safeXMainCharacter = mainCharacter.getX();
    safeYMainCharacter = mainCharacter.getY();
  }


  /** 
   * PERSONAJES 
   */

  /**
   * Desaparicion: Personajes 
   */
  for (Movable ghost : character) {

    if(shootCharacterCounter[ghost.getID()] >= 5){

      disappear.play();

      if(PacmanBattle.PLATFORM == PacmanBattle.ARDUINO){
        serialManager.write(PacmanBattle.VIBRATE_CONTROL_2);
      }

      switch(ghost.getID()){

        // BLINKY
        case 0:
          ghost.setX(350).setY(255);
          break;

        // CLYDE
        case 1:
          ghost.setX(350).setY(320);
          break;

        // INKY
        case 2:
          ghost.setX(420).setY(255);
          break;

        // PINKY
        case 3:
          ghost.setX(420).setY(320);
          break;

      }

      shootCharacterCounter[ghost.getID()] = 0;
      directionCharacter[ghost.getID()] = direction[round(random(0, (direction.length - 1)))];

    }

  }

  /**
   * Aparicion: Personaje actual
   */
  character[currentCharacter].move(directionCharacter[currentCharacter]);

  /**
   * Deteccion: Choque (Personaje actual <=> Laberinto || Personaje actual <=> Zona de protagonista) 
   */
  if ((character[currentCharacter].beside(maze) || character[currentCharacter].beside(zoneMainCharacter)) && (safeXCharacter[currentCharacter] > 0 && safeYCharacter[currentCharacter] > 0)) {
    character[currentCharacter].setX(safeXCharacter[currentCharacter]);
    character[currentCharacter].setY(safeYCharacter[currentCharacter]);
    directionCharacter[currentCharacter] = Movable.None;
  }

  /**
   * Deteccion: NoChoque (Personaje actual <=> Laberinto || Zona de protagonista) 
   */
  if (!character[currentCharacter].beside(maze) || !character[currentCharacter].beside(zoneMainCharacter)) {
    safeXCharacter[currentCharacter] = character[currentCharacter].getX();
    safeYCharacter[currentCharacter] = character[currentCharacter].getY();
  }

  /**
   * Aparicion: Personajes 
   */
  for (Movable ghost : character) {

    if (ghost.getID() != currentCharacter) {    

      ghost.move(directionCharacter[ghost.getID()]);

      // Deteccion: Choque (Personaje <=> Laberinto || Personaje <=> Zona de protagonista)
      if ((ghost.beside(maze) || ghost.beside(zoneMainCharacter)) && (safeXCharacter[ghost.getID()] > 0 && safeYCharacter[ghost.getID()] > 0)) {
        ghost.setX(safeXCharacter[ghost.getID()]);
        ghost.setY(safeYCharacter[ghost.getID()]);
        directionCharacter[ghost.getID()] = direction[round(random(0, (direction.length - 1)))];
      }

      // Deteccion: NoChoque (Personaje <=> Laberinto || Personaje <=> Zona de protagonista)
      if (!ghost.beside(maze) || !ghost.beside(zoneMainCharacter)) {
        safeXCharacter[ghost.getID()] = ghost.getX();
        safeYCharacter[ghost.getID()] = ghost.getY();
      }

      // Deteccion: Personaje sin direccion
      if (directionCharacter[ghost.getID()] == Movable.None) {
        directionCharacter[ghost.getID()] = direction[round(random(0, (direction.length - 1)))];
      }

    }

  }


  /**
   * DISPAROS
   */
  
  /** 
   * Aparicion: Disparos de protagonista 
   */
  for (int index = 0; index < shootMainCharacter.size(); index++) {

    Movable mainShoot = shootMainCharacter.get(index);
    mainShoot.move(mainShoot.getDirection());

    // Deteccion: Choque (Disparo <=> Laberinto || Disparo <=> Zona de personajes)
    if (mainShoot.beside(maze) || mainShoot.beside(zoneCharacter)) {
      
      mainShoot.setX(-mainShoot.getX());
      mainShoot.setY(-mainShoot.getY());
      mainShoot.setDirection(Movable.None);
      
      if(index >= shootMainCharacter.size()){
        shootMainCharacter.remove(index);
      }
      
    }

    // Deteccion: Choque (Disparo <=> Personaje actual)
    if (mainShoot.beside(character[currentCharacter]) ) {
      
      mainShoot.setX(-mainShoot.getX());
      mainShoot.setY(-mainShoot.getY());
      mainShoot.setDirection(Movable.None);
      scoreMainCharacter = scoreMainCharacter + 100;
      
      shootCharacterCounter[currentCharacter]++;
      
      if(index >= shootMainCharacter.size()){
        shootMainCharacter.remove(index);
      }
      
    }

    for (Movable ghost : character) {

      if (ghost.getID() != currentCharacter) {

        // Deteccion: Choque (Disparo <=> Personaje)
        if (mainShoot.beside(ghost)) {
          
          mainShoot.setX(-mainShoot.getX());
          mainShoot.setY(-mainShoot.getY());
          mainShoot.setDirection(Movable.None);
          scoreMainCharacter = scoreMainCharacter + 20;
          
          shootCharacterCounter[ghost.getID()]++;
          
          if(index >= shootMainCharacter.size()){
            shootMainCharacter.remove(index);
          }
          
        }

      }

    }

  }

  /**
   * Aparicion: Disparos de personaje actual
   */
  for (int index = 0; index < shootCharacter.size(); index++) {

    Movable characterShoot = shootCharacter.get(index);
    characterShoot.move(characterShoot.getDirection());

    // Deteccion: Choque (Disparo <=> Laberinto || Disparo <=>  Zona de protagonista)
    if (characterShoot.beside(maze) || characterShoot.beside(zoneMainCharacter)) {

      characterShoot.setX(-characterShoot.getX());
      characterShoot.setY(-characterShoot.getY());
      characterShoot.setDirection(Movable.None);

      if(index >= shootCharacter.size()){
        shootCharacter.remove(index);
      }

    }

    // Deteccion: Choque (Disparo <=> Protagonista)
    if (characterShoot.beside(mainCharacter)) {

      characterShoot.setX(-characterShoot.getX());
      characterShoot.setY(-characterShoot.getY());
      characterShoot.setDirection(Movable.None);
      scoreCharacter = scoreCharacter + 100;

      shootMainCharacterCounter++;

      if(index >= shootCharacter.size()){
        shootCharacter.remove(index);
      }

    }

  }


  /** 
   * DURACION 
   */
  gameCurrentDuration = gameDuration - (millis() / 1000);

  if(gameCurrentDuration == 0){
    gameFinalized = true;
  }

  return;
}

void serialEvent(Serial _) {

  if(PacmanBattle.PLATFORM != PacmanBattle.ARDUINO){
    return;
  }

  if(gameStarted == false){

      switch(serialManager.read()){

        case PacmanBattle.LEFT_CONTROL_1:
        case PacmanBattle.LEFT_CONTROL_2:

          if(currentStartMenuOption > 0){
            currentStartMenuOption--;
            beep.play();
          }

          break;

        case PacmanBattle.RIGHT_CONTROL_1:
        case PacmanBattle.RIGHT_CONTROL_2:

          if(currentStartMenuOption < 2){
            currentStartMenuOption++;
            beep.play();
          }

          break;

        case PacmanBattle.SHOOT_CONTROL_1:
        case PacmanBattle.SHOOT_CONTROL_2:
        case PacmanBattle.SWITCH_CONTROL_2:
        
          switch(currentStartMenuOption){
          
            // OPCION: 1 MINUTO
            case 0:
              gameDuration = 60;
              break;
          
            // OPCION: 3 MINUTOS
            case 1:
              gameDuration = 180;
              break;
          
            // OPCION: 5 MINUTOS
            case 2:
              gameDuration = 300;
              break;
          
          }
          
          gameStarted = true;

          break;

      }

    return;
  }

  switch(serialManager.read()) {

    case PacmanBattle.UP_CONTROL_1:
      directionMainCharacter = Movable.Up;
      break;

    case PacmanBattle.DOWN_CONTROL_1:
      directionMainCharacter = Movable.Down;
      break;

    case PacmanBattle.LEFT_CONTROL_1:
      directionMainCharacter = Movable.Left;
      break;

    case PacmanBattle.RIGHT_CONTROL_1:
      directionMainCharacter = Movable.Right;
      break;

    case PacmanBattle.UP_CONTROL_2:
      directionCharacter[currentCharacter] = Movable.Up;
      break;

    case PacmanBattle.DOWN_CONTROL_2:
      directionCharacter[currentCharacter] = Movable.Down;
      break;

    case PacmanBattle.LEFT_CONTROL_2:
      directionCharacter[currentCharacter] = Movable.Left;
      break;

    case PacmanBattle.RIGHT_CONTROL_2:
      directionCharacter[currentCharacter] = Movable.Right;
      break;

    case PacmanBattle.SWITCH_CONTROL_2:
      switchGhost();
      break;

    case PacmanBattle.SHOOT_CONTROL_1:
      shootFromMainCharacter();
      break;

    case PacmanBattle.SHOOT_CONTROL_2:
      shootFromCharacter();
      break;

  }

  return;
}

void keyPressed() {

  if(PacmanBattle.PLATFORM != PacmanBattle.PC){
    return;
  }

  if(gameStarted == false){

    if(key == CODED){

      switch(keyCode){

        case LEFT:

          if(currentStartMenuOption > 0){
            currentStartMenuOption--;
            beep.play();
          }

          break;

        case RIGHT:

          if(currentStartMenuOption < 2){
            currentStartMenuOption++;
            beep.play();
          }

          break;

        case ALT:
        
          switch(currentStartMenuOption){
          
            // OPCION: 1 MINUTO
            case 0:
              gameDuration = 60;
              break;
          
            // OPCION: 3 MINUTOS
            case 1:
              gameDuration = 180;
              break;
          
            // OPCION: 5 MINUTOS
            case 2:
              gameDuration = 300;
              break;
          
          }
          
          gameStarted = true;

          break;

      }

    }

    return;
  }

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

    case 'p':
      shootFromMainCharacter();
      break;

    case 'e':
      shootFromCharacter();
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
  character[currentCharacter].setStroke(0, 151, 230, 3);
  directionCharacter[currentCharacter] = Movable.None;

  return;
}

String convertDuration(int duration){

  int minutes = (duration / 60);
  int seconds = (duration % 60);

  return (minutes < 10 ? "0" + str(minutes) : str(minutes)) + ":" + (seconds < 10 ? "0" + str(seconds) : str(seconds));
}

void shootFromMainCharacter() {

  int shootX = (mainCharacter.getX() + (mainCharacter.getWidth() / 2)) - 3;
  int shootY = (mainCharacter.getY() + (mainCharacter.getHeight() / 2)) - 3;

  if (directionMainCharacter != Movable.None) {
    shootMainCharacter.add(new Movable(Movable.Rect, 6, 6).setFill(255, 255, 255).setStroke(0, 0, 0, 0).setSpeedX(10).setSpeedY(10).setX(shootX).setY(shootY).setDirection(directionMainCharacter));
    mainShoot.play();
  }

  return;
}

void shootFromCharacter() {

  int shootX = (character[currentCharacter].getX() + (character[currentCharacter].getWidth() / 2)) - 3;
  int shootY = (character[currentCharacter].getY() + (character[currentCharacter].getHeight() / 2)) - 3;

  if (directionCharacter[currentCharacter] != Movable.None) {
    shootCharacter.add(new Movable(Movable.Rect, 6, 6).setFill(255, 255, 255).setStroke(0, 0, 0, 0).setSpeedX(10).setSpeedY(10).setX(shootX).setY(shootY).setDirection(directionCharacter[currentCharacter]));
    characterShoot.play();
  }

  return;
}

void loadStrawberry() {

  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 44 ).setY( 124 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 46 ).setY( 176 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 47 ).setY( 222 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 47 ).setY( 274 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 46 ).setY( 324 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 45 ).setY( 361 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 45 ).setY( 412 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 47 ).setY( 452 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 49 ).setY( 509 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 50 ).setY( 557 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 109 ).setY( 562 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 130 ).setY( 521 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 127 ).setY( 475 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 125 ).setY( 426 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 152 ).setY( 398 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 207 ).setY( 407 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 263 ).setY( 408 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 317 ).setY( 409 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 350 ).setY( 411 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 358 ).setY( 467 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 276 ).setY( 461 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 204 ).setY( 477 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 207 ).setY( 514 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 209 ).setY( 556 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 268 ).setY( 559 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 316 ).setY( 560 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 365 ).setY( 556 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 409 ).setY( 556 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 466 ).setY( 554 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 516 ).setY( 554 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 577 ).setY( 552 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 632 ).setY( 554 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 676 ).setY( 555 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 722 ).setY( 553 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 761 ).setY( 552 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 760 ).setY( 500 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 752 ).setY( 454 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 751 ).setY( 409 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 743 ).setY( 364 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 746 ).setY( 325 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 748 ).setY( 278 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 747 ).setY( 233 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 747 ).setY( 180 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 712 ).setY( 264 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 667 ).setY( 262 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 597 ).setY( 266 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 598 ).setY( 198 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 675 ).setY( 202 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 666 ).setY( 141 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 543 ).setY( 192 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 509 ).setY( 202 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 513 ).setY( 241 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 518 ).setY( 299 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 515 ).setY( 347 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 517 ).setY( 392 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 465 ).setY( 401 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 430 ).setY( 404 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 434 ).setY( 473 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 397 ).setY( 474 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 442 ).setY( 514 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 517 ).setY( 507 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 518 ).setY( 471 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 575 ).setY( 476 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 637 ).setY( 473 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 678 ).setY( 470 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 675 ).setY( 418 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 635 ).setY( 402 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 582 ).setY( 407 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 581 ).setY( 345 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 637 ).setY( 339 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 683 ).setY( 340 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 456 ).setY( 192 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 399 ).setY( 191 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 351 ).setY( 191 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 309 ).setY( 188 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 273 ).setY( 188 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 226 ).setY( 190 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 189 ).setY( 189 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 119 ).setY( 192 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 199 ).setY( 153 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 92 ).setY( 125 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 144 ).setY( 125 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 197 ).setY( 127 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 245 ).setY( 126 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 305 ).setY( 124 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 366 ).setY( 124 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 419 ).setY( 123 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 469 ).setY( 124 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 514 ).setY( 124 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 568 ).setY( 124 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 98 ).setY( 268 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 105 ).setY( 339 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 160 ).setY( 265 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 163 ).setY( 340 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 218 ).setY( 268 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 222 ).setY( 343 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 280 ).setY( 271 ));
  strawberry.add(new Movable(Movable.Rect, 10, 10).setFill(232, 67, 147).setStroke(0, 0, 0, 1).setSpeedX(0).setSpeedY(0).setX( 287 ).setY( 342 ));

  return;
}
