/**
 ** PacmanBattle.h
 **
 ** Contenido:  Constantes utilizadas durante la ejecucion del programa.
 **
 **/

#ifndef PACMANBATTLE_H
#define PACMANBATTLE_H 1

/**
 * SERIAL
 */

/**
 * Definicion: Velocidad de transmision
 */
#define BAUD_RATE 9600


/**
 * ARDUINO
 */

/** 
 * Definicion: RX/TX Control #1
 */
#define RX_PIN_CONTROL_1  A0
#define TX_PIN_CONTROL_1  10

/** 
 * Definicion: RX/TX Control #2
 */
#define RX_PIN_CONTROL_2  A1
#define TX_PIN_CONTROL_2  9

/**
 * Definicion: Offset
 */
#define OFFSET_HIGH       5
#define OFFSET_LOW        5

/** 
 * Definicion: Delay
 */
#define DELAY             100


/**
 * INSTRUCCIONES 
 */

/**
 * Definicion: Deteccion
 */
#define NOTHING   '0'
#define LEFT      '1'
#define UP        '2'
#define DOWN      '3'
#define RIGHT     '4'
#define SHOOT     '5'
#define SWITCH    '6'

/** 
 * Definicion: Lectura
 */
#define LEFT_CONTROL_1    '7'
#define LEFT_CONTROL_2    '8'
#define UP_CONTROL_1      '9'
#define UP_CONTROL_2      'A'
#define DOWN_CONTROL_1    'B'
#define DOWN_CONTROL_2    'C'
#define RIGHT_CONTROL_1   'D'
#define RIGHT_CONTROL_2   'E'
#define SHOOT_CONTROL_1   'F'
#define SHOOT_CONTROL_2   'G'
#define SWITCH_CONTROL_1  'H'
#define SWITCH_CONTROL_2  'I'

/**
 * Definicion: Escritura 
 */
#define VIBRATE_CONTROL_1 'J'
#define VIBRATE_CONTROL_2 'K'

#endif
