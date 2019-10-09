#ifndef SERIALMANAGER_H
#define SERIALMANAGER_H 1

#include "Arduino.h"
#include "HardwareSerial.h"

class SerialManager {
  private:
    HardwareSerial *serial;
    int rate;
  public:
    SerialManager(HardwareSerial *, int);
    void init(void);
    char read(void);
    void write(char);
};

#endif
