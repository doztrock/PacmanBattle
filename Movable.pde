enum ShapeType {
  Ellipse, Rect
};

class Movable {

  /**
   * Forma
   */
  private ShapeType shape;

  /**
   * Dimensiones
   */
  private int sizeH;
  private int sizeW;

  /**
   * Opciones de color
   */
  private boolean useFill = false;
  private boolean useStroke = false;
  private float fillRGB[];
  private float strokeRGB[];

  /**
   * Coordenadas
   */
  private int positionX;
  private int positionY;

  /**
   * Registro
   */
  private int indexElement;
  private RegistryElement registryElement;

  Movable(ShapeType shape, int sizeH, int sizeW, PositionRegistry positionRegistry) {

    this.shape = shape;
    this.setHeight(sizeH);
    this.setWidth(sizeW);
    this.fillRGB = new float[3];
    this.strokeRGB = new float[3];

    this.setX(0);
    this.setY(0);

    this.indexElement = positionRegistry.register(this);
    this.registryElement = positionRegistry.getRegistry().get(indexElement);

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

    case Ellipse:
      ellipse(x, y, this.sizeW, this.sizeH);
      break;

    case Rect:
      rect(x, y, this.sizeW, this.sizeH);
      break;
    }

    return;
  }

  public void setSize(int sizeH, int sizeW) {

    this.setHeight(sizeH);
    this.setWidth(sizeW);

    return;
  }

  public void setHeight(int sizeH) {    
    this.sizeH = sizeH;
    return;
  }

  public int getHeight() {
    return this.sizeH;
  }

  public void setWidth(int sizeW) {
    this.sizeW = sizeW;
    return;
  }

  public int getWidth() {
    return this.sizeW;
  }

  public void setFill(float r, float g, float b) {

    this.fillRGB[0] = r;
    this.fillRGB[1] = g;
    this.fillRGB[2] = b;
    this.useFill = true;

    return;
  }

  public void setStroke(float r, float g, float b) {

    this.strokeRGB[0] = r;
    this.strokeRGB[1] = g;
    this.strokeRGB[2] = b;
    this.useStroke = true;

    return;
  }

  public void setX(int x) {
    this.positionX = x;
    return;
  }

  public int getX() {
    return this.positionX;
  }

  public void setY(int y) {
    this.positionY = y;
    return;
  }

  public int getY() {
    return this.positionY;
  }

  public void move() {

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
}
