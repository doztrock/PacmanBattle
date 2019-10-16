/**
 ** PacmanBattle.h
 **
 ** Contenido:  Constantes utilizadas durante la ejecucion del programa,
 **             niveles de los voltajes, pines.
 **
 **/

#ifndef PACMANBATTLE_H
#define PACMANBATTLE_H 1


/* Velocidad de transmision */
#define BAUD_RATE 9600


/* Pines: Control #1 */
#define RX_PIN_CONTROL_1  A0
#define TX_PIN_CONTROL_1  10


/* Pines: Control #2 */
#define RX_PIN_CONTROL_2  A2
#define TX_PIN_CONTROL_2  9


/** Niveles */

// LEFT
#define BUTTON_LEFT_HIGH  185
#define BUTTON_LEFT_LOW   165

// UP
#define BUTTON_UP_HIGH    127
#define BUTTON_UP_LOW     110

// DOWN
#define BUTTON_DOWN_HIGH  85
#define BUTTON_DOWN_LOW   70

// RIGHT
#define BUTTON_RIGHT_HIGH 65
#define BUTTON_RIGHT_LOW  67

// SHOOT
#define BUTTON_SHOOT_HIGH 181
#define BUTTON_SHOOT_LOW  170

// SWITCH
#define BUTTON_SWITCH_HIGH 206
#define BUTTON_SWITCH_LOW  201


/** Instrucciones */

// PRE-LECTURA
#define NOTHING   '0'
#define LEFT      '1'
#define UP        '2'
#define DOWN      '3'
#define RIGHT     '4'
#define SHOOT     '5'
#define SWITCH    '6'

// LECTURA
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

// ESCRITURA
#define VIBRATE_CONTROL_1 'J'
#define VIBRATE_CONTROL_2 'K'


#endif
