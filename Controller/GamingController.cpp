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

  int value = map(analogRead(this->rx), 0, 1023, 0, 255);

  if (value <= BUTTON_LEFT_HIGH && value >= BUTTON_LEFT_LOW) {
    return LEFT;
  }

  if (value <= BUTTON_UP_HIGH && value >= BUTTON_UP_LOW) {
    return UP;
  }

  if (value <= BUTTON_DOWN_HIGH && value >= BUTTON_DOWN_LOW) {
    return DOWN;
  }

  return NOTHING;
}

void GamingController::vibrate(void) {

  /* Iniciamos vibracion */
  analogWrite(this->tx, 100);
  delay(500);

  /* Detenemos vibracion */
  analogWrite(this->tx, 0);

  return;
}
