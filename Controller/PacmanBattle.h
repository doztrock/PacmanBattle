#ifndef PACMANBATTLE_H
#define PACMANBATTLE_H 1

// Baudios
#define BAUD_RATE 9600

// PINES PARA CONTROL 1
#define RX_PIN_CONTROL_1  A0
#define TX_PIN_CONTROL_1  10

// PINES PARA CONTROL 2
#define RX_PIN_CONTROL_2  A1
#define TX_PIN_CONTROL_2  9

// Niveles de los botones
#define BUTTON_LEFT_HIGH  508
#define BUTTON_LEFT_LOW   506

#define BUTTON_UP_HIGH    381
#define BUTTON_UP_LOW     373

#define BUTTON_DOWN_HIGH  282
#define BUTTON_DOWN_LOW   278

#define BUTTON_RIGHT_HIGH 192
#define BUTTON_RIGHT_LOW  188

// Instrucciones compartidas
#define LEFT      '1'
#define UP        '2'
#define DOWN      '3'
#define RIGHT     '4'
#define SHOOT     '5'
#define SWITCH    '6'

#define VIBRATE_CONTROL_1   '7'
#define VIBRATE_CONTROL_2   '8'

#endif
