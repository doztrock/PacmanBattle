#include "HardwareSerial.h"
#include "SerialManager.h"
#include "GamingController.h"
#include "PacmanBattle.h"

SerialManager serialManager(&Serial, BAUD_RATE);

GamingController gamingController1(RX_PIN_CONTROL_1, TX_PIN_CONTROL_1);
//GamingController gamingController2(RX_PIN_CONTROL_2, TX_PIN_CONTROL_2);

void setup() {

  serialManager.init();

  gamingController1.init();
  //gamingController2.init();

  return;
}

void loop() {

  /* Lectura de serial */
  char value = serialManager.read();

  switch (value) {

    case VIBRATE_CONTROL_1:
      gamingController1.vibrate();
      break;

    case VIBRATE_CONTROL_2:
      break;

  }

  /* Deteccion en control #1 */
  char movementController1 = gamingController1.detectMovement();

  if (gamingController1.getLastMovement() != movementController1) {

    switch (movementController1) {

      case LEFT:
        serialManager.write(LEFT_CONTROL_1);
        break;

      case UP:
        serialManager.write(UP_CONTROL_1);
        break;

      case DOWN:
        serialManager.write(DOWN_CONTROL_1);
        break;

      case RIGHT:
        serialManager.write(RIGHT_CONTROL_1);
        break;

    }

    gamingController1.setLastMovement(movementController1);

  }

  delay(100);
  return;
}
