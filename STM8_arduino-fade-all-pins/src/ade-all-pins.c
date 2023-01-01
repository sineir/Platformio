#include <Arduino.h>
/*
 * Alterado 2023-01-01
 * pisca 7 leds
 */

#include <Arduino.h>

int brightness = 0; // how bright the LED is
int fadeAmount = 5; // how many points to fade the LED by
char i;
int leds[] = {8, 9, 5, 6, 12, 10, 11};
int laps = 0;
// the setup routine runs once when you press reset:
void setup()
{
  // declare all pin to be an output:
  // for (i = 0; i < NUM_DIGITAL_PINS; i++)
  // pinMode(i, OUTPUT);

  for (i = 8; i < 13; i++)
    pinMode(i, OUTPUT);

  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  digitalWrite(8, HIGH);
  digitalWrite(9, HIGH);
}

// the loop routine runs over and over again forever:
void loop()
{

  // set the brightness of all pins:
  analogWrite(5, brightness);
  analogWrite(6, brightness);
  analogWrite(12, brightness);

  // change the brightness for next time through the loop:
  brightness = brightness + fadeAmount;

  if (brightness % 51 == 0)
  {
    for (i = 8; i < 12; i++)
    {
      digitalWrite(i, !digitalRead(i));
    }
  }

  // reverse the direction of the fading at the ends of the fade:
  if (brightness == 0 || brightness == 255)
  {
    fadeAmount = -fadeAmount;
    laps++;
  }
  // wait for 30 milliseconds to see the dimming effect
  delay(7);

  if (laps == 10)
  {
    laps = 0;
    for (int kk = 0; kk < 10; kk++)
    {

      for (i = 0; i < 7; i++)
        digitalWrite(leds[i], LOW);

      for (int j = 0; j < 7; j++)
      {
        digitalWrite(leds[j], HIGH);
        delay(40);
      }

      for (int j = 0; j < 7; j++)
      {
        digitalWrite(leds[j], LOW);
        delay(40);
      }
    }

    for (int kk = 0; kk < 10; kk++)
    {

      for (i = 0; i < 7; i++)
        digitalWrite(leds[i], LOW);

      for (int j = 6; j >= 0; j--)
      {
        digitalWrite(leds[j], HIGH);
        delay(40);
      }

      for (int j = 6; j >= 0; j--)
      {
        digitalWrite(leds[j], LOW);
        delay(40);
      }
    }

    digitalWrite(8, HIGH);
    digitalWrite(9, HIGH);
  }
}
