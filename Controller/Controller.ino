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
    .LEFT_HIGH = 243 + OFFSET_HIGH,
    .LEFT_LOW = 243 - OFFSET_LOW,
    .UP_HIGH = 230 + OFFSET_HIGH,
    .UP_LOW = 230 - OFFSET_LOW,
    .DOWN_HIGH = 208 + OFFSET_HIGH,
    .DOWN_LOW = 208 - OFFSET_LOW,
    .RIGHT_HIGH = 181 + OFFSET_HIGH,
    .RIGHT_LOW = 181 - OFFSET_LOW,
    .SHOOT_HIGH = 135 + OFFSET_HIGH,
    .SHOOT_LOW = 135-+ OFFSET_LOW
  };

  /**
   * Inicializacion: Control #1 
   */
  gamingController1.init();
  gamingController1.assign(levelController1);

  /**
   * Inicializacion: Niveles de control #2
   */
  levelController2 = {
    .LEFT_HIGH = 237  + OFFSET_HIGH,
    .LEFT_LOW = 237 - OFFSET_LOW,
    .UP_HIGH = 225 + OFFSET_HIGH,
    .UP_LOW = 225 - OFFSET_LOW,
    .DOWN_HIGH = 203 + OFFSET_HIGH,
    .DOWN_LOW = 203 - OFFSET_LOW,
    .RIGHT_HIGH = 178 + OFFSET_HIGH,
    .RIGHT_LOW = 178 - OFFSET_LOW,
    .SHOOT_HIGH = 125 + OFFSET_HIGH,
    .SHOOT_LOW = 125 - OFFSET_LOW,
    .SWITCH_HIGH = 78 + OFFSET_HIGH,
    .SWITCH_LOW = 78 - OFFSET_LOW,
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
  //gamingController1.calibrate(serialManager);

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

    case SHOOT:
      serialManager.write(SHOOT_CONTROL_1);
      break;

  }


  /**
   * Deteccion: Control #2
   */
  char movementController2 = gamingController2.detectMovement();
  //gamingController2.calibrate(serialManager);

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

    case SHOOT:
      serialManager.write(SHOOT_CONTROL_2);
      break;

    case SWITCH:
      serialManager.write(SWITCH_CONTROL_2);
      break;

  }

  delay(DELAY);
  return;
}
