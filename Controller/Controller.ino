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
    .LEFT_HIGH = 215 + OFFSET_HIGH,
    .LEFT_LOW = 200 + OFFSET_LOW,
    .UP_HIGH = 165 + OFFSET_HIGH,
    .UP_LOW = 150 + OFFSET_LOW,
    .DOWN_HIGH = 75 + OFFSET_HIGH,
    .DOWN_LOW = 60 + OFFSET_LOW,
    .RIGHT_HIGH = 225 + OFFSET_HIGH,
    .RIGHT_LOW = 210 + OFFSET_LOW,
    .SHOOT_HIGH = 45 + OFFSET_HIGH,
    .SHOOT_LOW = 30 + OFFSET_LOW
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
    .LEFT_HIGH = 182  + OFFSET_HIGH,
    .LEFT_LOW = 175 + OFFSET_LOW,
    .UP_HIGH = 130 + OFFSET_HIGH,
    .UP_LOW = 115 + OFFSET_LOW,
    .DOWN_HIGH = 25 + OFFSET_HIGH,
    .DOWN_LOW = 10 + OFFSET_LOW,
    .RIGHT_HIGH = 191 + OFFSET_HIGH,
    .RIGHT_LOW = 184 + OFFSET_LOW,
    .SHOOT_HIGH = 250 + OFFSET_HIGH,
    .SHOOT_LOW = 240 + OFFSET_LOW,
    .SWITCH_HIGH = 65 + OFFSET_HIGH,
    .SWITCH_LOW = 55 + OFFSET_LOW,
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

    case SHOOT:
      serialManager.write(SHOOT_CONTROL_1);
      break;

  }


  /**
   * Deteccion: Control #2
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
