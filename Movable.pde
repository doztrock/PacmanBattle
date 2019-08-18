class Movable {

  /**
   * Constantes de forma
   */
  public static final int Rect    = (1 << 0);
  public static final int Ellipse = (1 << 1);
  public static final int Image   = (1 << 2);

  /**
   * Constantes de forma
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
  private String imageName;

  /**
   * Dimensiones
   */
  private int sizeH;
  private int sizeW;

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
  private int positionX;
  private int positionY;

  /**
   * Velocidad
   */
  private int speedX;
  private int speedY;

  /**
   * Registro
   */
  private int indexElement;
  private RegistryElement registryElement;

  Movable(int shape, int sizeH, int sizeW, PositionRegistry positionRegistry) {

    this.useFill = false;
    this.useStroke = false;
    this.fillRGB = new float[3];
    this.strokeRGB = new float[3];

    this.shape = shape;
    this.image = null;

    this.setHeight(sizeH);
    this.setWidth(sizeW);

    this.setX(0);
    this.setY(0);

    this.setSpeedX(5);
    this.setSpeedY(5);

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

  public void setSpeedX(int speedX) {
    this.speedX = speedX;
    return;
  }

  public int getSpeedX() {
    return this.speedX;
  }

  public void setSpeedY(int speedY) {
    this.speedY = speedY;
    return;
  }

  public int getSpeedY() {
    return this.speedY;
  }

  public void setImageName(String imageName) {

    this.imageName = imageName;
    this.image = loadImage(this.imageName);

    return;
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
}
