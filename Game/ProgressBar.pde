/**
 * Esta clase se encarga de la visualizacion de las barras de progreso.
 *
 * Para empezar contamos con que la barra de progreso puede tener un valor
 * que se ha de medir en porcentajes desde 0% hasta 100%, debido a que el largo
 * de la barra no debe suponer un problema al realizar la graficacion de la misma
 * en la pantalla.
 *
 */
class ProgressBar {

  /**
   * Constantes
   */
  public static final int MAX_PROGRESS = 100;
  public static final int MIN_PROGRESS = 0;

  /**
   * Coordenadas
   */
  private int x;
  private int y;

  /**
   * Dimensiones
   */
  private int sizeW;
  private int sizeH;

  /**
   * Opciones de color
   */
  private boolean useFill = false;
  private boolean useStroke = false;
  private float fillRGB[];
  private float strokeRGB[];

  /**
   * Progreso
   */
  private int progress;

  /**
   * Constructor
   *
   * Parametros:  x     -> Posicion en eje X
   *              y     -> Posicion en eje Y
   *              sizeW -> Anchura
   *              sizeH -> Altura
   *
   */
  ProgressBar(int x, int y, int sizeW, int sizeH) {

    this.fillRGB = new float[3];
    this.strokeRGB = new float[3];

    this.setX(x);
    this.setY(y);

    this.setWidth(sizeW);
    this.setHeight(sizeH);    

    this.setProgress(MIN_PROGRESS);

    return;
  }

  /**
   * Funcion:     outerElement
   *
   * Objetivo:    Dibujar el elemento exterior de la barra de progreso.
   *
   * Parametros:  x     -> Posicion en eje X
   *              y     -> Posicion en eje Y
   *              sizeW -> Anchura
   *              sizeH -> Altura
   *  
   * Retorno:     N/A
   *
   */
  private void outerElement(int x, int y, int sizeW, int sizeH) {

    if (this.useFill == true) {
      fill(this.fillRGB[0], this.fillRGB[1], this.fillRGB[2]);
      this.useFill = false;
    }

    if (this.useStroke == true) {
      stroke(this.strokeRGB[0], this.strokeRGB[1], this.strokeRGB[2]);
      this.useStroke = false;
    }

    rect(x, y, sizeW, sizeH);

    return;
  }

  /**
   * Funcion:     innerElement
   *
   * Objetivo:    Dibujar el elemento interior de la barra de progreso.
   *
   * Parametros:  x     -> Posicion en eje X
   *              y     -> Posicion en eje Y
   *              sizeW -> Anchura
   *              sizeH -> Altura
   *  
   * Retorno:     N/A
   *
   */
  private void innerElement(int x, int y, int sizeW, int sizeH) {

    if (this.useFill == true) {
      fill(this.fillRGB[0], this.fillRGB[1], this.fillRGB[2]);
      this.useFill = false;
    }

    if (this.useStroke == true) {
      stroke(this.strokeRGB[0], this.strokeRGB[1], this.strokeRGB[2]);
      this.useStroke = false;
    }

    rect(x, y, sizeW, sizeH);

    return;
  }

  /**
   * Funcion:     setX
   *
   * Objetivo:    Asignar el valor al atributo X, 
   *              correspondiente a la posicion de la barra de progreso sobre el eje X.
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
   *              correspondiente a la posicion de la barra de progreso sobre el eje X.
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
   *              correspondiente a la posicion de la barra de progreso sobre el eje Y.
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
   *              correspondiente a la posicion de la barra de progreso sobre el eje Y.
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
   * Funcion:     setSize
   *
   * Objetivo:    Asignar las dimensiones de la barra de progreso.
   *
   * Parametros:  sizeW -> Anchura
   *              sizeH -> Altura
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
   * Objetivo:    Asignar la anchura de la barra de progreso.
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
   * Objetivo:    Obtener la anchura de la barra de progreso.
   *
   * Parametros:  N/A
   * 
   * Retorno:     Anchura de la barra de progreso
   *
   */
  public int getWidth() {
    return this.sizeW;
  }

  /**
   * Funcion:     setHeight
   *
   * Objetivo:    Asignar la altura de la barra de progreso.
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
   * Objetivo:    Obtener la altura de la barra de progreso.
   *
   * Parametros:  N/A
   * 
   * Retorno:     Altura de la barra de progreso
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
  private void setFill(float r, float g, float b) {

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
  private void setStroke(float r, float g, float b) {

    this.strokeRGB[0] = r;
    this.strokeRGB[1] = g;
    this.strokeRGB[2] = b;
    this.useStroke = true;

    return;
  }

  /**
   * Funcion:     setProgress
   *
   * Objetivo:    Asignar el valor del progreso de la barra.
   *
   * Parametros:  progress -> Progreso de la barra
   *  
   * Retorno:     N/A
   *
   */
  public void setProgress(int progress) {    

    if (progress >= MIN_PROGRESS && progress <= MAX_PROGRESS) {
      this.progress = progress;
    } else if (progress < MIN_PROGRESS) {
      this.progress = MIN_PROGRESS;
    } else if (progress > MAX_PROGRESS) {
      this.progress = MAX_PROGRESS;
    }

    return;
  }

  /**
   * Funcion:     getProgress
   *
   * Objetivo:    Obtener el progreso de la barra.
   *
   * Parametros:  N/A
   * 
   * Retorno:     Progreso de la barra
   *
   */
  public int getProgress() {
    return this.progress;
  }

  /**
   * Funcion:     show
   *
   * Objetivo:    Dibujar la barra de progreso, con colores por defecto.
   *
   * Parametros:  N/A
   *
   * Retorno:     N/A
   *
   */
  public void show() {

    this.setFill(255, 255, 255);
    this.setStroke(255, 255, 255);  
    this.outerElement(this.getX(), this.getY(), this.getWidth(), this.getHeight());

    this.setFill(0, 0, 0);
    this.setStroke(0, 0, 0); 
    this.innerElement(this.getX() + 5, this.getY() + 5, (int) ((this.getProgress() * (this.getWidth() - 10)) / 100), this.getHeight() - 10);

    return;
  }

  /**
   * Funcion:     show
   *
   * Objetivo:    Dibujar la barra de progreso.
   *
   * Parametros:  or  ->  Rojo (Elemento externo)
   *              og  ->  Verde (Elemento externo)
   *              ob  ->  Azul (Elemento externo)
   *              ir  ->  Rojo (Elemento interno)
   *              ig  ->  Verde (Elemento interno)
   *              ib  ->  Azul (Elemento interno)
   *
   * Retorno:     N/A
   *
   */
  public void show(float or, float og, float ob, float ir, float ig, float ib) {

    this.setFill(or, og, ob);
    this.setStroke(or, og, ob);  
    this.outerElement(this.getX(), this.getY(), this.getWidth(), this.getHeight());

    this.setFill(ir, ig, ib);
    this.setStroke(ir, ig, ib); 
    this.innerElement(this.getX() + 5, this.getY() + 5, (int) ((this.getProgress() * (this.getWidth() - 10)) / 100), this.getHeight() - 10);

    return;
  }
}
