class ProgressBar {

  private int positionX;
  private int positionY;
  private int sizeW;
  private int sizeH;  
  private boolean useFill = false;
  private boolean useStroke = false;
  private float fillRGB[];
  private float strokeRGB[];
  private int progress;

  ProgressBar(int x, int y, int sizeW, int sizeH) {

    this.setX(x);
    this.setY(y);
    this.setWidth(sizeW);
    this.setHeight(sizeH);    

    this.fillRGB = new float[3];
    this.strokeRGB = new float[3];

    this.setProgress(0);

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
    this.progress = progress;
    return;
  }

  public int getProgress() {
    return this.progress;
  }

  public void show() {

    this.setFill(52, 152, 219);
    this.setStroke(41, 128, 185);  
    this.outerElement(this.getX(), this.getY(), this.getWidth(), this.getHeight());

    this.setFill(26, 188, 156);
    this.setStroke(22, 160, 133); 
    this.innerElement(this.getX() + 5, this.getY() + 5, (int) ((this.getProgress() * (this.getWidth() - 10)) / 100), this.getHeight() - 10);

    return;
  }
}
