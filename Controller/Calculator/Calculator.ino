#include <limits.h>

#define MAX_ELEMENT 10 * 20

int PIN_IN_CONTROL_1 = A0;
int PIN_IN_CONTROL_2 = A1;

int PIN_OUT_CONTROL_1 = 10;
int PIN_OUT_CONTROL_2 = 9;

unsigned short int read_control_1;
unsigned short int read_control_2;

unsigned short int counter_control_1;
unsigned short int counter_control_2;

unsigned short int value_control_1[MAX_ELEMENT];
unsigned short int value_control_2[MAX_ELEMENT];
int counter;

void setup() {

  Serial.begin(9600);

  pinMode(PIN_OUT_CONTROL_1, OUTPUT);
  pinMode(PIN_OUT_CONTROL_2, OUTPUT);

  counter_control_1 = 0;
  counter_control_2 = 0;

  counter = 0;

  return;
}

void loop() {

  if (counter < MAX_ELEMENT) {

    read_control_1 = analogRead(PIN_IN_CONTROL_1);
    read_control_2 = analogRead(PIN_IN_CONTROL_2);

    if (read_control_1 > 50) {
      value_control_1[counter_control_1] = read_control_1;
      counter_control_1++;
    }

    if (read_control_2 > 50) {
      value_control_2[counter_control_2] = read_control_2;
      counter_control_2++;
    }

    Serial.print(".");

  } else {

    Serial.println("");
    Serial.print("MAX CONTROL 1:");
    Serial.println(getMaxValue(value_control_1, counter_control_1));
    Serial.print("MIN CONTROL 1:");
    Serial.println(getMinValue(value_control_1, counter_control_1));

    Serial.print("MAX CONTROL 2:");
    Serial.println(getMaxValue(value_control_2, counter_control_2));
    Serial.print("MIN CONTROL 2:");
    Serial.println(getMinValue(value_control_2, counter_control_2));

    analogWrite(PIN_OUT_CONTROL_1, 100);
    analogWrite(PIN_OUT_CONTROL_2, 100);

    delay(1000 * 15);

  }

  counter++;
  delay(100);
}

int getMaxValue(int list[MAX_ELEMENT], int counter) {

  int maxValue = INT_MIN;

  for (int i = 0; i < counter; i++) {

    if (list[i] > 50) {

      if (list[i] > maxValue) {
        maxValue = list[i];
      }

    }

  }

  return maxValue;
}

int getMinValue(int list[MAX_ELEMENT], int counter) {

  int minValue = INT_MAX;

  for (int i = 0; i < counter; i++) {

    if (list[i] > 50) {

      if (list[i] < minValue) {
        minValue = list[i];
      }

    }

  }

  return minValue;
}
