#include "HardwareSerial.h"
#include "SerialManager.h"
#include "GamingController.h"
#include "PacmanBattle.h"

/* Administrador de serial */
SerialManager serialManager(&Serial, BAUD_RATE);

/* Control #1 */
//GamingController gamingController1(RX_PIN_CONTROL_1, TX_PIN_CONTROL_1);

/* Control #2 */
GamingController gamingController2(RX_PIN_CONTROL_2, TX_PIN_CONTROL_2);

void setup() {

  /* Inicializacion: Administrador de serial */
  //serialManager.init();

  /* Inicializacion: Control #1 */
  //gamingController1.init();

  /* Inicializacion: Control #2 */
  gamingController2.init();

  Serial.begin(9600);

  return;
}

void loop() {

  /* Deteccion: Administrador de serial */
  /*  switch (serialManager.read()) {

      // Vibracion: Control #1
      case VIBRATE_CONTROL_1:
        //      gamingController1.vibrate();
        break;

      // Vibracion: Control #2
      case VIBRATE_CONTROL_2:
        gamingController2.vibrate();
        break;

    }
  */

  /* Deteccion: Control #2 */
  char movementController2 = gamingController2.detectMovement();

  Serial.println(movementController2);

  /*  char movementController1 = gamingController1.detectMovement();

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
  */
  delay(250);
  return;
}
