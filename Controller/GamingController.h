/**
 ** GamingController.h
 **
 ** Contenido:  Clase utilizada para manejar el control del videojuego,
 **             en el se definen los pines, los niveles 
 **             y las funciones fisicas del control.
 **
 **/

#ifndef GAMINGCONTROLLER_H
#define GAMINGCONTROLLER_H 1

#include "Arduino.h"
#include "Level.h"
#include "PacmanBattle.h"
#include "SerialManager.h"

#include <stdint.h>

class GamingController {
  private:
    uint8_t rx;
    uint8_t tx;
    Level level;
  public:
    GamingController(uint8_t, uint8_t);
    void init(void);
    char detectMovement(void);
    void vibrate(void);
    void assign(Level);
    void calibrate(SerialManager);
};

#endif
