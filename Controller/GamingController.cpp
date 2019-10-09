#include "Arduino.h"
#include "GamingController.h"

GamingController::GamingController(int rx, int tx) {

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

  if (value <= BUTTON_LEFT_HIGH && value >= BUTTON_LEFT_LOW) {
    return LEFT;
  }

  if (value <= BUTTON_UP_HIGH && value >= BUTTON_UP_LOW) {
    return UP;
  }

  if (value <= BUTTON_DOWN_HIGH && value >= BUTTON_DOWN_LOW) {
    return DOWN;
  }

  if (value <= BUTTON_RIGHT_HIGH && value >= BUTTON_RIGHT_LOW) {
    return RIGHT;
  }

}

void GamingController::vibrate(void) {
}

void GamingController::setLastMovement(char lastMovement) {
  this->lastMovement = lastMovement;
}

char GamingController::getLastMovement(void) {
  return this->lastMovement;
}
