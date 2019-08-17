class PositionRegistry {

  class Element {
    private int X1;
    private int X2;
    private int Y1;
    private int Y2;

    public void setPosition(int X1, int X2, int Y1, int Y2) {

      this.X1 = X1;
      this.X2 = X2;
      this.Y1 = Y1;
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

  private ArrayList<Element> registry;

  PositionRegistry() {
    this.registry = new ArrayList<Element>();
  }

  public void register() {
    
  }
}
