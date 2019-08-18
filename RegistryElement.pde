class RegistryElement {

  private int X1;
  private int X2;
  private int Y1;
  private int Y2;

  public void setPosition(int X1, int X2, int Y1, int Y2) {

    this.setX1(X1);
    this.setX2(X2);
    this.setY1(Y1);
    this.setY2(Y2);

    return;
  }

  public void setX1(int X1) {
    this.X1 = X1;
    return;
  }

  public void setX2(int X2) {
    this.X2 = X2;
    return;
  }

  public void setY1(int Y1) {
    this.Y1 = Y1;
    return;
  }

  public void setY2(int Y2) {
    this.Y2 = Y2;
    return;
  }

  public int getX1() {
    return this.X1;
  }

  public int getX2() {
    return this.X2;
  }

  public int getY1() {
    return this.Y1;
  }

  public int getY2() {
    return this.Y2;
  }
}
