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

  uint8_t value = map(analogRead(this->rx), 0, 1023, 0, 255);

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

  if (value <= this->level.SHOOT_HIGH && value >= this->level.SHOOT_LOW) {
    return SHOOT;
  }

  if (value <= this->level.SWITCH_HIGH && value >= this->level.SWITCH_LOW) {
    return SWITCH;
  }

  return NOTHING;
}

void GamingController::vibrate(void) {

  analogWrite(this->tx, 100);
  delay(150);
  analogWrite(this->tx, 0);

  return;
}

void GamingController::assign(Level level) {
  this->level = level;
  return;
}

void GamingController::calibrate(SerialManager serialManager){
  serialManager.write("=>" + String(map(analogRead(this->rx), 0, 1023, 0, 255)));
  return;
}
