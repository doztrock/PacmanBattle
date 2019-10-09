#ifndef GAMINGCONTROLLER_H
#define GAMINGCONTROLLER_H 1

#include "Arduino.h"
#include "PacmanBattle.h"

class GamingController {
  private:
    unsigned short rx;
    unsigned short tx;
    char lastMovement;
  public:
    GamingController(int, int);
    void init(void);
    char detectMovement(void);
    void vibrate(void);
    void setLastMovement(char);
    char getLastMovement(void);
};

#endif
