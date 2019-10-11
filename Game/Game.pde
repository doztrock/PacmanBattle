SerialManager serialManager;

void setup() {

  serialManager = new SerialManager("/dev/ttyACM0", 9600, this);

  /* Pantalla */
  size(800, 600);

  return;
} 


  boolean written = false;

void draw() {

  background(0);

  // TODO: lastWrite for arduino
  char value = serialManager.read();  

  print(value);

  if (!written) {
    serialManager.write('J');
    written = true;
  }

  //println(serialManager.read());

  return;
}
