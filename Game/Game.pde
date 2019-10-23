/* Declaracion: Fondo */
PImage maze = null;

/* Declaracion: Laberinto */
Movable[] wall;

void setup() {

  /* Inicializacion: Pantalla */
  size(800, 600);

  /* Inicializacion: Fondo */
  maze = loadImage("data/image/background/maze.png");

  /* Inicializacion: Laberinto */
  wall = new Movable[]{

    // CONTORNO

    new Movable(Movable.Rect, 11, 509).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(4).setY(84), 
    new Movable(Movable.Rect, 791, 11).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(4).setY(84), 
    new Movable(Movable.Rect, 11, 509).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(784).setY(84), 
    new Movable(Movable.Rect, 791, 11).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(4).setY(584), 

    // HORIZONTALES

    new Movable(Movable.Rect, 87, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(83).setY(157), 
    new Movable(Movable.Rect, 165, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(239).setY(157), 
    new Movable(Movable.Rect, 88, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(551).setY(157), 

    new Movable(Movable.Rect, 401, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(83).setY(227), 

    new Movable(Movable.Rect, 166, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(83).setY(299), 
    new Movable(Movable.Rect, 165, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(551).setY(299), 

    new Movable(Movable.Rect, 87, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(83).setY(371), 
    new Movable(Movable.Rect, 164, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(239).setY(371), 
    new Movable(Movable.Rect, 88, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(628).setY(371), 

    new Movable(Movable.Rect, 89, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(160).setY(442), 
    new Movable(Movable.Rect, 167, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(473).setY(442), 

    new Movable(Movable.Rect, 164, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(239).setY(514), 
    new Movable(Movable.Rect, 165, 10).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(551).setY(514), 

    // VERTICALES
    new Movable(Movable.Rect, 11, 143).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(628).setY(94), 

    new Movable(Movable.Rect, 11, 81).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(707).setY(157), 
    new Movable(Movable.Rect, 11, 80).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(83).setY(157), 

    new Movable(Movable.Rect, 11, 152).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(315).setY(228), 
    new Movable(Movable.Rect, 11, 143).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(473).setY(228), 
    new Movable(Movable.Rect, 11, 153).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(551).setY(228), 

    new Movable(Movable.Rect, 11, 225).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(707).setY(299), 

    new Movable(Movable.Rect, 11, 152).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(83).setY(371), 
    new Movable(Movable.Rect, 11, 80).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(396).setY(371), 

    new Movable(Movable.Rect, 11, 151).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(160).setY(444), 

    new Movable(Movable.Rect, 11, 80).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(315).setY(443), 
    new Movable(Movable.Rect, 11, 80).setFill(52, 152, 219).setStroke(255, 255, 255, 0).setX(473).setY(443), 

    // ZONAS

    new Movable(Movable.Rect, 147, 134).setFill(255, 255, 255).setStroke(255, 255, 255, 0).setX(326).setY(237), 
    new Movable(Movable.Rect, 77, 64).setFill(255, 255, 255).setStroke(255, 255, 255, 0).setX(707).setY(93) 

  };

  return;
}

void draw() {

  /* Aparicion: Fondo */
  background(maze);

  for (Movable s : wall) {
    s.move();
  }

  return;
}
