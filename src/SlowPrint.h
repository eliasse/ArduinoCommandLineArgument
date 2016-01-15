#include <Arduino.h>
#include <HardwareSerial.h>

void sprint(char *str)
{
  Serial.print(str); delay(100);
}

void sprintln(char *str)
{
  Serial.println(str); delay(100);
}
