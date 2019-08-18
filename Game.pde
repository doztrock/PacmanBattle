PositionRegistry positionRegistry;
Movable movable1;
Movable movable2;

void setup() {

  size(800, 600);

  positionRegistry =  new PositionRegistry();
  movable1 = new Movable(positionRegistry);
  movable2 = new Movable(positionRegistry);

  return;
} 

void draw() {
  background(0);

  movable1.setFill(255, 255, 255);
  movable1.move(mouseX, mouseY);
  
  movable2.setFill(255, 255, 255);
  movable2.move(400, 200);

  for(RegistryElement e : positionRegistry.getRegistry()){
  
      println(e.getX1());
  
  }
  

  return;
}
