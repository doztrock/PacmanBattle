#include "HardwareSerial.h"
#include "SerialManager.h"
#include "GamingController.h"
#include "PacmanBattle.h"

SerialManager serialManager(&Serial, BAUD_RATE);

GamingController gamingController1(RX_PIN_CONTROL_1, TX_PIN_CONTROL_1);
GamingController gamingController2(RX_PIN_CONTROL_2, TX_PIN_CONTROL_2);

void setup() {

  serialManager.init();

  gamingController1.init();
  gamingController2.init();

  return;
}

void loop() {

  /* Manejo de control #1 */
  char movementController1 = gamingController1.detectMovement();

  if (gamingController1.getLastMovement() != movementController1) {
    serialManager.write(movementController1);
    gamingController1.setLastMovement(movementController1);
  }

  /* Manejo de control #2 */
  /*
  char movementController2 = gamingController2.detectMovement();

  if (gamingController2.getLastMovement() != movementController2) {
    serialManager.write(movementController2);
    gamingController2.setLastMovement(movementController2);
  }
  */

  delay(100);
  return;
}
