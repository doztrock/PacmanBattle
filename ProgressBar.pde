class ProgressBar {

  /**
   * Constantes
   */
  public static final int MAX_PROGRESS = 100;
  public static final int MIN_PROGRESS = 0;

  /**
   * Coordenadas
   */
  private int positionX;
  private int positionY;

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

  ProgressBar(int x, int y, int sizeW, int sizeH) {

    this.setX(x);
    this.setY(y);
    this.setWidth(sizeW);
    this.setHeight(sizeH);    

    this.fillRGB = new float[3];
    this.strokeRGB = new float[3];

    this.setProgress(MIN_PROGRESS);

    return;
  }

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

  public void setSize(int sizeW, int sizeH) {

    this.setWidth(sizeW);
    this.setHeight(sizeH);

    return;
  }

  public void setWidth(int sizeW) {
    this.sizeW = sizeW;
    return;
  }

  public int getWidth() {
    return this.sizeW;
  }

  public void setHeight(int sizeH) {    
    this.sizeH = sizeH;
    return;
  }

  public int getHeight() {
    return this.sizeH;
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

  public int getProgress() {
    return this.progress;
  }

  public void show() {

    this.setFill(255, 255, 255);
    this.setStroke(255, 255, 255);  
    this.outerElement(this.getX(), this.getY(), this.getWidth(), this.getHeight());

    this.setFill(0, 0, 0);
    this.setStroke(0, 0, 0); 
    this.innerElement(this.getX() + 5, this.getY() + 5, (int) ((this.getProgress() * (this.getWidth() - 10)) / 100), this.getHeight() - 10);

    return;
  }

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
