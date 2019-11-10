#ifndef SERIALMANAGER_H
#define SERIALMANAGER_H 1

#include "Arduino.h"
#include "HardwareSerial.h"

#include <stdint.h>

class SerialManager {
  private:
    HardwareSerial *serial;
    int rate;
  public:
    SerialManager(HardwareSerial *, int);
    void init(void);
    char read(void);
    void write(char);
    void write(uint8_t);
    void write(String);
};

#endif
