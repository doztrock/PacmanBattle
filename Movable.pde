/**
 * Esta clase se encarga de manejar cualquier objeto con el que se pueda interactuar.
 *
 * Cada objeto contara con unas coordenadas, velocidad, forma, colores y un registro
 * que se hace de manera interna sobre una lista en la que se guardaran las cuatro coordenadas
 * del objeto, para asi determinar si quiere que este interactue o no con otros objectos del
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
   * Registro
   */
  private RegistryElement registryElement;

  Movable(int shape, int sizeW, int sizeH, PositionRegistry positionRegistry) {

    this.useFill = false;
    this.useStroke = false;
    this.fillRGB = new float[3];
    this.strokeRGB = new float[3];

    this.shape = shape;
    this.image = null;

    this.setWidth(sizeW);
    this.setHeight(sizeH);    

    this.setX(0);
    this.setY(0);

    this.setSpeedX(5);
    this.setSpeedY(5);

    this.registryElement = positionRegistry.register(this);

    return;
  }

  private void draw(int x, int y) {

    if (this.useFill == true) {
      fill(this.fillRGB[0], this.fillRGB[1], this.fillRGB[2]);
    }

    if (this.useStroke == true) {
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
   * Retorno:     N/A
   *
   */
  public void setFill(float r, float g, float b) {

    this.fillRGB[0] = r;
    this.fillRGB[1] = g;
    this.fillRGB[2] = b;
    this.useFill = true;

    return;
  }

  /**
   * Funcion:     setStroke
   *
   * Objetivo:    Asignar color de contorno de un elemento.
   *
   * Parametros:  r -> Rojo
   *              g -> Verde
   *              b -> Azul
   *
   * Retorno:     N/A
   *
   */
  public void setStroke(float r, float g, float b) {

    this.strokeRGB[0] = r;
    this.strokeRGB[1] = g;
    this.strokeRGB[2] = b;
    this.useStroke = true;

    return;
  }

  /**
   * Funcion:     setX
   *
   * Objetivo:    Asignar el valor al atributo x, 
   *              correspondiente a la posicion del elemento sobre el eje X.
   *
   * Parametros:  x -> Posicion en eje X
   *  
   * Retorno:     N/A
   *
   */
  public void setX(int x) {
    this.x = x;
    return;
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
   * Retorno:     N/A
   *
   */
  public void setY(int y) {
    this.y = y;
    return;
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
   * Retorno:     N/A
   *
   */
  public void setSpeedX(int speedX) {
    this.speedX = speedX;
    return;
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
   * Retorno:     N/A
   *
   */
  public void setSpeedY(int speedY) {
    this.speedY = speedY;
    return;
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
   * Funcion:     getRegistryElement
   *
   * Objetivo:    Obtener el puntero al registro de elementos respectivo a este objeto.
   *
   * Parametros:  N/A
   *
   * Retorno:     Puntero al registro de elementos respectivo a este objeto.
   *
   */
  public RegistryElement getRegistryElement() {
    return this.registryElement;
  }

  public void move() {

    this.draw(this.getX(), this.getY());

    this.registryElement.setX1(this.getX());
    this.registryElement.setX2(this.getX() + this.getWidth());
    this.registryElement.setY1(this.getY());
    this.registryElement.setY2(this.getY() + this.getHeight());

    return;
  }

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

    this.registryElement.setX1(this.getX());
    this.registryElement.setX2(this.getX() + this.getWidth());
    this.registryElement.setY1(this.getY());
    this.registryElement.setY2(this.getY() + this.getHeight());

    return;
  }

  public void move(int x, int y) {

    this.setX(x);
    this.setY(y);

    this.draw(this.getX(), this.getY());

    this.registryElement.setX1(this.getX());
    this.registryElement.setX2(this.getX() + this.getWidth());
    this.registryElement.setY1(this.getY());
    this.registryElement.setY2(this.getY() + this.getHeight());

    return;
  }

  public boolean beside(Movable movable) {

    /** Coordenadas de este objeto */
    int X1 = this.getRegistryElement().getX1();
    int X2 = this.getRegistryElement().getX2();
    int Y1 = this.getRegistryElement().getY1();
    int Y2 = this.getRegistryElement().getY2();

    /** Coordenadas del objeto externo */
    int movableX1 = movable.getRegistryElement().getX1();
    int movableX2 = movable.getRegistryElement().getX2();
    int movableY1 = movable.getRegistryElement().getY1();
    int movableY2 = movable.getRegistryElement().getY2();

    /** Arriba */
    if ((X2 >= movableX1 && X1 <= movableX2) || (Y2 >= movableY1 && Y1 <= movableY2)) {
      if ((Y2 >= movableY1 && Y2 <= movableY2) || (Y2 >= movableY1 && Y2 <= movableY2)) {
        return true;
      }
    }

    return false;
  }
}
