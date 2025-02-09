/**
 * Esta clase se encarga de manejar cualquier objeto con el que se pueda interactuar.
 *
 * Cada objeto contara con unas coordenadas, velocidad, forma, colores y un registro
 * que se hace de manera interna sobre un objeto en el que se guardaran las cuatro coordenadas
 * del elemento, para asi determinar si quiere que este interactue o no con otros elementos del
 * mismo tipo.
 *
 * Cabe aclarar tambien que cada objeto de la clase Movable podra tambien manejar una velocidad
 * en ambos ejes, tanto en eje X como en el eje Y, medido en pixeles por movimiento. 
 *
 */
class Movable {

  /**
   * Constantes de forma
   */
  public static final int Rect	= (1 << 0);
  public static final int Image	= (1 << 1);

  /**
   * Constantes de movimiento
   */
  public static final int Up    = (1 << 0);
  public static final int Down  = (1 << 1);
  public static final int Left  = (1 << 2);
  public static final int Right = (1 << 3);
  public static final int None = (1 << 4);

  /**
   * Forma
   */
  private int shape;
  private PImage image;

  /**
   * Dimensiones
   */
  private int sizeW;
  private int sizeH;  

  /**
   * Opciones de color
   */
  private boolean useFill;
  private boolean useStroke;
  private float fillRGB[];
  private float strokeRGB[];

  /**
   * Coordenadas
   */
  private int x;
  private int y;

  /**
   * Velocidad
   */
  private int speedX;
  private int speedY;

  /**
   * Posicion
   */
  private PositionElement positionElement;

  /**
   * Direccion
   */
  private int direction;

  /**
   * ID
   */
  private int ID;

  /**
   * Constructor
   *
   * Parametros:  shape -> Forma
   *              sizeW -> Anchura
   *              sizeH -> Altura
   *
   */
  Movable(int shape, int sizeW, int sizeH) {

    this.useFill = false;
    this.useStroke = false;
    this.fillRGB = new float[3];
    this.strokeRGB = new float[4];

    this.shape = shape;
    this.image = null;

    this.setWidth(sizeW);
    this.setHeight(sizeH);    

    this.setX(0);
    this.setY(0);

    this.setSpeedX(5);
    this.setSpeedY(5);

    this.positionElement = new PositionElement();

    return;
  }

  /**
   * Funcion:     draw
   *
   * Objetivo:    Dibujar el objeto en la pantalla.
   *
   * Parametros:  x -> Posicion en eje X
   *              y -> Posicion en eje Y
   *  
   * Retorno:     N/A
   *
   */
  private void draw(int x, int y) {

    if (this.useFill == true) {
      fill(this.fillRGB[0], this.fillRGB[1], this.fillRGB[2]);
    }

    if (this.useStroke == true) {
      strokeWeight(this.strokeRGB[3]);
      stroke(this.strokeRGB[0], this.strokeRGB[1], this.strokeRGB[2]);
    }

    switch(this.shape) {

    case Rect:
      rect(x, y, this.sizeW, this.sizeH);
      break;

    case Image:

      if (this.image != null) {
        noFill();
        noStroke();
        image(this.image, x, y, this.getWidth(), this.getHeight());
      } else {
        text("N/A", x, y);
      }

      break;
    }

    return;
  }

  /**
   * Funcion:     setSize
   *
   * Objetivo:    Asignar las dimensiones del objeto.
   *
   * Parametros:  sizeH -> Altura
   *              sizeW -> Anchura
   *  
   * Retorno:     N/A
   *
   */
  public void setSize(int sizeW, int sizeH) {

    this.setWidth(sizeW);
    this.setHeight(sizeH);

    return;
  }

  /**
   * Funcion:     setWidth
   *
   * Objetivo:    Asignar la anchura del objeto.
   *
   * Parametros:  sizeW -> Anchura
   *   
   * Retorno:     N/A
   *
   */
  public void setWidth(int sizeW) {
    this.sizeW = sizeW;
    return;
  }

  /**
   * Funcion:     getWidth
   *
   * Objetivo:    Obtener la anchura del objeto.
   *
   * Parametros:  N/A
   * 
   * Retorno:     Anchura del objeto
   *
   */
  public int getWidth() {
    return this.sizeW;
  }

  /**
   * Funcion:     setHeight
   *
   * Objetivo:    Asignar la altura del objeto.
   *
   * Parametros:  sizeH -> Altura
   *  
   * Retorno:     N/A
   *
   */
  public void setHeight(int sizeH) {    
    this.sizeH = sizeH;
    return;
  }

  /**
   * Funcion:     getHeight
   *
   * Objetivo:    Obtener la altura del objeto.
   *
   * Parametros:  N/A
   * 
   * Retorno:     Altura del objeto
   *
   */
  public int getHeight() {
    return this.sizeH;
  }

  /**
   * Funcion:     setFill
   *
   * Objetivo:    Asignar color de llenado de un elemento.
   *
   * Parametros:  r -> Rojo
   *              g -> Verde
   *              b -> Azul
   *
   * Retorno:     Puntero al objeto
   *
   */
  public Movable setFill(float r, float g, float b) {

    this.fillRGB[0] = r;
    this.fillRGB[1] = g;
    this.fillRGB[2] = b;
    this.useFill = true;

    return this;
  }

  /**
   * Funcion:     setStroke
   *
   * Objetivo:    Asignar color de contorno de un elemento.
   *
   * Parametros:  r -> Rojo
   *              g -> Verde
   *              b -> Azul
   *              weight -> Grosor de linea
   *
   * Retorno:     Puntero al objeto
   *
   */
  public Movable setStroke(float r, float g, float b, float weight) {

    this.strokeRGB[0] = r;
    this.strokeRGB[1] = g;
    this.strokeRGB[2] = b;
    this.strokeRGB[3] = weight; 
    this.useStroke = true;

    return this;
  }

  /**
   * Funcion:     setX
   *
   * Objetivo:    Asignar el valor al atributo x, 
   *              correspondiente a la posicion del elemento sobre el eje X.
   *
   * Parametros:  x -> Posicion en eje X
   *  
   * Retorno:     Puntero al objeto
   *
   */
  public Movable setX(int x) {
    this.x = x;
    return this;
  }

  /**
   * Funcion:     getX
   *
   * Objetivo:    Obtener el valor del atributo X, 
   *              correspondiente a la posicion del objeto sobre el eje X.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Posicion sobre el eje X
   *
   */
  public int getX() {
    return this.x;
  }

  /**
   * Funcion:     setY
   *
   * Objetivo:    Asignar el valor al atributo Y, 
   *              correspondiente a la posicion del objeto sobre el eje Y.
   *
   * Parametros:  y -> Posicion en eje Y
   *  
   * Retorno:     Puntero al objeto
   *
   */
  public Movable setY(int y) {
    this.y = y;
    return this;
  }

  /**
   * Funcion:     getY
   *
   * Objetivo:    Obtener el valor del atributo Y, 
   *              correspondiente a la posicion del objeto sobre el eje Y.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Posicion sobre el eje Y
   *
   */
  public int getY() {
    return this.y;
  }

  /**
   * Funcion:     setSpeedX
   *
   * Objetivo:    Asignar el valor al atributo speedX, 
   *              correspondiente a la velocidad del objeto sobre el eje X.
   *
   * Parametros:  speedX -> Velocidad en eje X
   *  
   * Retorno:     Puntero al objeto
   *
   */
  public Movable setSpeedX(int speedX) {
    this.speedX = speedX;
    return this;
  }

  /**
   * Funcion:     getSpeedX
   *
   * Objetivo:    Obtener el valor del atributo speedX, 
   *              correspondiente a la velocidad del objeto sobre el eje X.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Velocidad en el eje X
   *
   */
  public int getSpeedX() {
    return this.speedX;
  }

  /**
   * Funcion:     setSpeedY
   *
   * Objetivo:    Asignar el valor al atributo speedY, 
   *              correspondiente a la velocidad del objeto sobre el eje Y.
   *
   * Parametros:  speedX -> Velocidad en eje Y
   *  
   * Retorno:     Puntero al objeto
   *
   */
  public Movable setSpeedY(int speedY) {
    this.speedY = speedY;
    return this;
  }

  /**
   * Funcion:     getSpeedY
   *
   * Objetivo:    Obtener el valor del atributo speedY, 
   *              correspondiente a la velocidad del objeto sobre el eje Y.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Velocidad en el eje Y
   *
   */
  public int getSpeedY() {
    return this.speedY;
  }

  /**
   * Funcion:     setImagePath
   *
   * Objetivo:    Asignar la ruta de la imagen que sera cargada en el objeto PImage.
   *
   * Parametros:  imagePath -> Ruta a la imagen
   *
   * Retorno:     N/A
   *
   */
  public void setImagePath(String imagePath) {
    this.image = loadImage(imagePath);
    return;
  }

  /**
   * Funcion:     getPositionElement
   *
   * Objetivo:    Obtener el puntero al objeto de posicion respectivo a este objeto.
   *
   * Parametros:  N/A
   *
   * Retorno:     Puntero al objeto de posicion respectivo a este objeto
   *
   */
  public PositionElement getPositionElement() {
    return this.positionElement;
  }

  /**
   * Funcion:     setDirection
   *
   * Objetivo:    Asignar el valor al atributo direction, 
   *              correspondiente a la direccion del objeto.
   *
   * Parametros:  direction -> Direccion del objeto
   *  
   * Retorno:     Puntero al objeto
   *
   */
  public Movable setDirection(int direction) {
    this.direction = direction;
    return this;
  }

  /**
   * Funcion:     getDirection
   *
   * Objetivo:    Obtener el valor del atributo direction, 
   *              correspondiente a la direccion del objeto.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Direccion del objeto
   *
   */
  public int getDirection() {
    return this.direction;
  }

  /**
   * Funcion:     setID
   *
   * Objetivo:    Asignar el valor al atributo ID, 
   *              correspondiente al identificador del objeto.
   *
   * Parametros:  ID -> Identificador del objeto
   *  
   * Retorno:     Puntero al objeto
   *
   */
  public Movable setID(int ID) {
    this.ID = ID;
    return this;
  }

  /**
   * Funcion:     getID
   *
   * Objetivo:    Obtener el valor del atributo ID, 
   *              correspondiente al identificador del objeto.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Identificador del objeto
   *
   */
  public int getID() {
    return this.ID;
  }

  /**
   * Funcion:     move
   *
   * Objetivo:    Mover el objeto a las coordenadas respectivas, previamente asignadas.
   *
   * Parametros:  N/A
   *
   * Retorno:     N/A
   *
   */
  public void move() {

    this.draw(this.getX(), this.getY());

    this.positionElement.setX1(this.getX());
    this.positionElement.setX2(this.getX() + this.getWidth());
    this.positionElement.setY1(this.getY());
    this.positionElement.setY2(this.getY() + this.getHeight());

    return;
  }

  /**
   * Funcion:     move
   *
   * Objetivo:    Mover el objeto en la direccion respectiva.
   *
   * Parametros:  direction -> Direccion hacia donde se movera el objeto.
   *
   * Retorno:     N/A
   *
   */
  public void move(int direction) {

    switch(direction) {

    case Up:
      this.setY(this.getY() - this.getSpeedY());
      break;

    case Down:
      this.setY(this.getY() + this.getSpeedY());
      break;

    case Left:
      this.setX(this.getX() - this.getSpeedX());
      break;

    case Right:
      this.setX(this.getX() + this.getSpeedX());
      break;
    }

    this.draw(this.getX(), this.getY());

    this.positionElement.setX1(this.getX());
    this.positionElement.setX2(this.getX() + this.getWidth());
    this.positionElement.setY1(this.getY());
    this.positionElement.setY2(this.getY() + this.getHeight());

    return;
  }

  /**
   * Funcion:     move
   *
   * Objetivo:    Mover el objeto a las coordenadas respectivas.
   *
   * Parametros:  x -> Posicion en eje X
   *              y -> Posicion en eje Y
   *
   * Retorno:     N/A
   *
   */
  public void move(int x, int y) {

    this.setX(x);
    this.setY(y);

    this.draw(this.getX(), this.getY());

    this.positionElement.setX1(this.getX());
    this.positionElement.setX2(this.getX() + this.getWidth());
    this.positionElement.setY1(this.getY());
    this.positionElement.setY2(this.getY() + this.getHeight());

    return;
  }

  /**
   * Funcion:     beside
   *
   * Objetivo:    Determinar si este objeto se ha acercado a otro.
   *
   * Parametros:  movable -> Instancia del objeto a evaluar
   *
   * Retorno:     TRUE si se ha acercado a otro objeto, FALSE en caso contrario
   *
   */
  public boolean beside(Movable movable) {

    /** Coordenadas de este objeto */
    int X1 = this.getPositionElement().getX1();
    int X2 = this.getPositionElement().getX2();
    int Y1 = this.getPositionElement().getY1();
    int Y2 = this.getPositionElement().getY2();

    /** Coordenadas del objeto externo */
    int movableX1 = movable.getPositionElement().getX1();
    int movableX2 = movable.getPositionElement().getX2();
    int movableY1 = movable.getPositionElement().getY1();
    int movableY2 = movable.getPositionElement().getY2();

    if ((X2 >= movableX1 && X1 <= movableX2)) {
      if (Y2 >= movableY1 && Y1 <= movableY2) {
        return true;
      }
    }

    return false;
  }

  /**
   * Funcion:     beside
   *
   * Objetivo:    Determinar si este objeto se ha acercado a alguno de los de la lista.
   *
   * Parametros:  movables -> Arreglo de instancias de objetos a evaluar
   *
   * Retorno:     TRUE si se ha acercado a algun objeto de la lista, FALSE en caso contrario
   *
   */
  public boolean beside(Movable[] movables) {

    for (Movable movable : movables) {
      if (this.beside(movable)) {
        return true;
      }
    }

    return false;
  }
}
