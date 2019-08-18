class PositionRegistry {

  private ArrayList<RegistryElement> registry;

  PositionRegistry() {
    this.registry = new ArrayList<RegistryElement>();
  }

  public int register(Movable object) {

    RegistryElement element = new RegistryElement();

    element.setX1(object.getX());
    element.setX2(object.getX() + object.getWidth());
    element.setY1(object.getY());
    element.setY2(object.getY() + object.getHeight());

    this.registry.add(element);

    return (this.registry.size() - 1);
  }

  public ArrayList<RegistryElement> getRegistry() {
    return this.registry;
  }
}
