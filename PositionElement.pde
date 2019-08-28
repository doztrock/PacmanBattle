/**
 * Esta clase se encarga de almacenar las coordenadas completas de un objeto.
 *
 * Para empezar debemos tener en cuenta que los objetos siempre cuentan con unas coordenadas (X,Y)
 * pero debemos saber hasta que parte cubre el objeto, adjuntando la anchura y la altura de este.
 * 
 * Ejemplo:
 *
 *   +--------+
 *   |        |
 *   |        |
 *   +--------+
 *
 * Para este caso, un elemento que empiece en una posicion (0,0) pero tenga 10 pixeles de altura
 * y 20 de anchura, entonces se extiende desde X1=0, X2=20, Y1=0, Y2=10.
 *
 */
class PositionElement {

  /**
   * Coordenadas
   */
  private int X1;
  private int X2;
  private int Y1;
  private int Y2;

  /**
   * Funcion:     setX1
   *
   * Objetivo:    Asignar el valor al atributo X1, 
   *              correspondiente a la posicion del objeto sobre el eje X, donde empieza.
   *
   * Parametros:  X1 -> Posicion en X1
   *  
   * Retorno:     N/A
   *
   */
  public void setX1(int X1) {
    this.X1 = X1;
    return;
  }

  /**
   * Funcion:     setX2
   *
   * Objetivo:    Asignar el valor al atributo X2, 
   *              correspondiente a la posicion del objeto sobre el eje X, donde termina.
   *
   * Parametros:  X2 -> Posicion en X2
   *  
   * Retorno:     N/A
   *
   */
  public void setX2(int X2) {
    this.X2 = X2;
    return;
  }

  /**
   * Funcion:     setY1
   *
   * Objetivo:    Asignar el valor al atributo Y1, 
   *              correspondiente a la posicion del objeto sobre el eje Y, donde empieza.
   *
   * Parametros:  Y1 -> Posicion en Y1
   *  
   * Retorno:     N/A
   *
   */
  public void setY1(int Y1) {
    this.Y1 = Y1;
    return;
  }

  /**
   * Funcion:     setY2
   *
   * Objetivo:    Asignar el valor al atributo Y2, 
   *              correspondiente a la posicion del objeto sobre el eje Y, donde termina.
   *
   * Parametros:  Y2 -> Posicion en Y2
   *  
   * Retorno:     N/A
   *
   */
  public void setY2(int Y2) {
    this.Y2 = Y2;
    return;
  }

  /**
   * Funcion:     getX1
   *
   * Objetivo:    Obtener el valor del atributo X1, 
   *              correspondiente a la posicion del objeto sobre el eje X, donde empieza.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Posicion en X1
   *
   */
  public int getX1() {
    return this.X1;
  }

  /**
   * Funcion:     getX2
   *
   * Objetivo:    Obtener el valor del atributo X2, 
   *              correspondiente a la posicion del objeto sobre el eje X, donde termina.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Posicion en X2
   *
   */
  public int getX2() {
    return this.X2;
  }

  /**
   * Funcion:     getY1
   *
   * Objetivo:    Obtener el valor del atributo Y1, 
   *              correspondiente a la posicion del objeto sobre el eje Y, donde empieza.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Posicion en Y1
   *
   */
  public int getY1() {
    return this.Y1;
  }

  /**
   * Funcion:     getY2
   *
   * Objetivo:    Obtener el valor del atributo Y2, 
   *              correspondiente a la posicion del objeto sobre el eje Y, donde termina.
   *
   * Parametros:  N/A
   *  
   * Retorno:     Posicion en Y2
   *
   */
  public int getY2() {
    return this.Y2;
  }
}
