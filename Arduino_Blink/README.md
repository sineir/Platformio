#Blink UNO
1. Placa: Arduino UNO 
2. Plataforma: AtmelAvr
3. Framework: Arduino

```
#include <Arduino.h>

void setup() {
  // put your setup code here, to run once:
  pinMode(13,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(13,!digitalRead(13));
}
```
