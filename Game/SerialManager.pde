import processing.serial.*;

class SerialManager {

  private Serial serial;

  public SerialManager(String port, int rate, PApplet context) {
    this.serial = new Serial(context, port, rate);
    return;
  }

  public char read() {

    if (this.serial.available() > 0) {
      return (char) this.serial.read();
    }

    return 0;
  }

  public void write(char character) {
    this.serial.write(character);
    return;
  }
}
