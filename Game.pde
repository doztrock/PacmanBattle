PositionRegistry positionRegistry;
Movable movable;

void setup() {

  size(800, 600);

  positionRegistry =  new PositionRegistry();
  movable = new Movable(positionRegistry);

  return;
} 

void draw() {
  background(0);

  movable.setFill(255, 255, 255);
  movable.move(mouseX, mouseY);

  for(Element e : positionRegistry.getRegistry()){
  
      println(e.getX1());
  
  }
  

  return;
}
