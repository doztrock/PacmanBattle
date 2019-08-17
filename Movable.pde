enum ShapeType {
  Ellipse, Rect
};

class Movable {

  private ShapeType shape;
  private int sizeH;
  private int sizeW;
  private boolean useFill = false;
  private boolean useStroke = false;
  private float fillRGB[];
  private float strokeRGB[];
  private int positionX;
  private int positionY;
  
  PositionRegistry positionRegistry;
  int index;

  Movable(PositionRegistry positionRegistry) {

    this.shape = ShapeType.Rect;
    this.setHeight(50);
    this.setWidth(70);
    this.fillRGB = new float[3];
    this.strokeRGB = new float[3];

    this.positionX = 0;
    this.positionY = 0;
    
    this.positionRegistry = positionRegistry;
    this.index = positionRegistry.register(this);

    return;
  }

  Movable(ShapeType shape, int sizeH, int sizeW) {

    this.shape = shape;
    this.setHeight(sizeH);
    this.setWidth(sizeW);
    this.fillRGB = new float[3];
    this.strokeRGB = new float[3];

    this.positionX = 0;
    this.positionY = 0;

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
    this.draw(this.positionX, this.positionY);
    return;
  }

  public void move(int x, int y) {

    this.positionX = x;
    this.positionY = y;

    this.draw(this.positionX, this.positionY);


    this.positionRegistry.getRegistry().get(this.index).setPosition(this.getX(), this.getX(), this.getY(), this.getY());

    return;
  }
}
