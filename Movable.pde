class Movable {

  private int sizeH;
  private int sizeW;
  private boolean useFill = false;
  private boolean useStroke = false;
  private float fillRGB[];
  private float strokeRGB[];

  Movable(int sizeH, int sizeW) {
    this.setHeight(sizeH);
    this.setWidth(sizeW);
    this.fillRGB = new float[3];
    this.strokeRGB = new float[3];
  }

  private void draw(int x, int y) {

    if (this.useFill == true) {
      fill(this.fillRGB[0], this.fillRGB[1], this.fillRGB[2]);
    }

    if (this.useStroke == true) {
      stroke(this.strokeRGB[0], this.strokeRGB[1], this.strokeRGB[2]);
    }

    rect(x, y, this.sizeH, this.sizeW);
  }

  public void setSize(int sizeH, int sizeW) {
    this.setHeight(sizeH);
    this.setWidth(sizeW);
  }

  public void setHeight(int sizeH) {
    this.sizeH = sizeH;
  }

  public int getHeight() {
    return this.sizeH;
  }

  public void setWidth(int sizeW) {
    this.sizeW = sizeW;
  }

  public int getWidth() {
    return this.sizeW;
  }

  public void setFill(float r, float g, float b) {
    this.fillRGB[0] = r;
    this.fillRGB[1] = g;
    this.fillRGB[2] = b;
    this.useFill = true;
  }

  public void setStroke(float r, float g, float b) {
    this.strokeRGB[0] = r;
    this.strokeRGB[1] = g;
    this.strokeRGB[2] = b;
    this.useStroke = true;
  }

  public void move(int x, int y) {
    this.draw(x, y);
  }
}
