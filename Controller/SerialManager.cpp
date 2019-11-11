#include "Arduino.h"
#include "HardwareSerial.h"
#include "SerialManager.h"

SerialManager::SerialManager(HardwareSerial *serial, int rate) {

  this->serial = serial;
  this->rate = rate;

  return;
}

void SerialManager::init(void) {
  this->serial->begin(rate);
  return;
}

char SerialManager::read(void) {

  if (this->serial->available() > 0) {
    return this->serial->read();
  }

  return;
}

void SerialManager::write(char character) {
  this->serial->println(character);
  return;
}

void SerialManager::write(uint8_t number) {  
  this->serial->println(String(number));
  return;
}

void SerialManager::write(String string) {  
  this->serial->println(string);
  return;
}
