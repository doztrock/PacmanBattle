#include "HardwareSerial.h"
#include "SerialManager.h"
#include "GamingController.h"
#include "PacmanBattle.h"

/**
 * SERIAL 
 */

/**
 * Declaracion: Manager
 */
SerialManager serialManager(&Serial, BAUD_RATE);


/**
 * CONTROLES
 */

/** 
 * Declaracion: Control #1
 */
GamingController gamingController1(RX_PIN_CONTROL_1, TX_PIN_CONTROL_1);

/** 
 * Declaracion: Control #2
 */
GamingController gamingController2(RX_PIN_CONTROL_2, TX_PIN_CONTROL_2);


void setup() {

  /* Inicializacion: Administrador de serial */
  serialManager.init();

  /* Inicializacion: Control #1 */
  gamingController1.init();

  /* Inicializacion: Control #2 */
  gamingController2.init();

  return;
}

void loop() {

  /* Lectura: Administrador de serial */
  char readingSerialManager = serialManager.read();

  switch (readingSerialManager) {

    case VIBRATE_CONTROL_1:
      gamingController1.vibrate();
      break;

    case VIBRATE_CONTROL_2:
      gamingController2.vibrate();
      break;

  }

  /* Deteccion: Control #1 */
  /*
    char movementController1 = gamingController1.detectMovement();

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
  */

  /* Deteccion: Control #2 */
  char movementController2 = gamingController2.detectMovement();

  switch (movementController2) {

    case LEFT:
      serialManager.write(LEFT_CONTROL_2);
      break;

    case UP:
      serialManager.write(UP_CONTROL_2);
      break;

    case DOWN:
      serialManager.write(DOWN_CONTROL_2);
      break;

    case RIGHT:
      serialManager.write(RIGHT_CONTROL_2);
      break;

  }

  delay(150);
  return;
}
