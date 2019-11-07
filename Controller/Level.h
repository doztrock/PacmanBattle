/**
 ** Level.h
 **
 ** Contenido:  Estructura designada para almacenar los valores
 **             de los niveles obtenidos por parte del control.
 **
 **/

#ifndef LEVEL_H
#define LEVEL_H 1

#include <stdint.h>

/**
 * NIVELES
 */

/**
 * Definicion: Estructura de nivel 
 */
typedef struct __level {
  uint8_t LEFT_HIGH;
  uint8_t LEFT_LOW;
  uint8_t UP_HIGH;
  uint8_t UP_LOW;
  uint8_t DOWN_HIGH;
  uint8_t DOWN_LOW;
  uint8_t RIGHT_HIGH;
  uint8_t RIGHT_LOW;
  uint8_t SHOOT_HIGH;
  uint8_t SHOOT_LOW;
  uint8_t SWITCH_HIGH;
  uint8_t SWITCH_LOW;
} Level;

#endif
