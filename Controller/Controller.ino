#include "PacmanBattle.h"
#include "SerialManager.h"
#include "GamingController.h"

/**
 * SERIAL 
 */

/**
 * Declaracion: Manager
 */
SerialManager serialManager(&Serial, BAUD_RATE);


/**
 * NIVELES
 */

/** 
 * Declaracion: Niveles de control #1
 */
Level levelController1;

/** 
 * Declaracion: Niveles de control #2
 */
Level levelController2;


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

  /**
   * Inicializacion: Administrador de serial 
   */
  serialManager.init();

  /**
   * Inicializacion: Niveles de control #1 
   */
  levelController1 = {
    .LEFT_HIGH = 970 + OFFSET_HIGH,
    .LEFT_LOW = 960 + OFFSET_LOW,
    .UP_HIGH = 920 + OFFSET_HIGH,
    .UP_LOW = 875 + OFFSET_LOW,
    .DOWN_HIGH = 835 + OFFSET_HIGH,
    .DOWN_LOW = 825 + OFFSET_LOW,
    .RIGHT_HIGH = 735 + OFFSET_HIGH,
    .RIGHT_LOW = 715 + OFFSET_LOW
  };

  /**
   * Inicializacion: Control #1 
   */
  gamingController1.init();
  gamingController2.assign(levelController1);

  /**
   * Inicializacion: Niveles de control #2
   */
  levelController1 = {
    .LEFT_HIGH = 905 + OFFSET_HIGH,
    .LEFT_LOW = 850 + OFFSET_LOW,
    .UP_HIGH = 845 + OFFSET_HIGH,
    .UP_LOW = 800 + OFFSET_LOW,
    .DOWN_HIGH = 735 + OFFSET_HIGH,
    .DOWN_LOW = 710 + OFFSET_LOW,
    .RIGHT_HIGH = 685 + OFFSET_HIGH,
    .RIGHT_LOW = 650 + OFFSET_LOW
  };

  /**
   * Inicializacion: Control #2 
   */
  gamingController2.init();
  gamingController2.assign(levelController2);

  return;
}

void loop() {

  /**
   * Lectura: Administrador de serial 
   */
  char readingSerialManager = serialManager.read();

  switch (readingSerialManager) {

    case VIBRATE_CONTROL_1:
      gamingController1.vibrate();
      break;

    case VIBRATE_CONTROL_2:
      gamingController2.vibrate();
      break;

  }


  /**
   * Deteccion: Control #1 
   */
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
  

  /**
   * Deteccion: Control #1 
   */
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

  delay(DELAY);
  return;
}
