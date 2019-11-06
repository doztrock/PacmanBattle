/**
 ** GamingController.cpp
 **
 ** Contenido:  Clase utilizada para manejar el control del videojuego,
 **             en el se inicializan los pines, los niveles 
 **             y las funciones fisicas del control.
 **
 **/

#include "Arduino.h"
#include "GamingController.h"

GamingController::GamingController(uint8_t rx, uint8_t tx) {

  this->rx = rx;
  this->tx = tx;

  return;
}

void GamingController::init(void) {

  pinMode(this->rx, INPUT);
  pinMode(this->tx, OUTPUT);

  return;
}

char GamingController::detectMovement(void) {

  int value = analogRead(this->rx);

  if (value <= this->level.LEFT_HIGH && value >= this->level.LEFT_LOW) {
    return LEFT;
  }

  if (value <= this->level.UP_HIGH && value >= this->level.UP_LOW) {
    return UP;
  }

  if (value <= this->level.DOWN_HIGH && value >= this->level.DOWN_LOW) {
    return DOWN;
  }

  if (value <= this->level.RIGHT_HIGH && value >= this->level.RIGHT_LOW) {
    return RIGHT;
  }

  return NOTHING;
}

void GamingController::vibrate(void) {

// TODO: Este delay se debe quitar, porque pausaria el juego
  analogWrite(this->tx, 100);
  delay(500);
  analogWrite(this->tx, 0);

  return;
}

void GamingController::assign(Level level) {
  this->level = level;
  return;
}
