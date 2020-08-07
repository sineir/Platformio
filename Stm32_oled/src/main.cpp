/*
RotaryEncoder lib https://github.com/mathertel/RotaryEncoder
*/
#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <RotaryEncoder.h>
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels //era 32

// Declaration for SSD1306 display connected using software SPI (default case):
#define OLED_MOSI   PB7//9
#define OLED_CLK   PB8//10
#define OLED_DC    PA6//11
#define OLED_CS    PB12//12
#define OLED_RESET PA7//13
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT,
OLED_MOSI, OLED_CLK, OLED_DC, OLED_RESET, OLED_CS);

//Pinos de ligacao do encoder
RotaryEncoder encoder(PB10, PB11);
const int pinoSW = PB1; //PINO DIGITAL (SW)

//Variavel para o botao do encoder
int valor = 0;
int newPos = 0;

void mainMenu(void) ;

/*
Source:channel
    ->B.T.
    ->MP3
    ->FM
    ->Aux.
Sound:
    ->Volume
    ->Bass
    ->Treble
    ->Bal
    ->Gain
*/


void setup()
{
  pinMode(pinoSW, INPUT);
  Serial.begin(9600);
  Serial.println("Gire o encoder....");
  pinMode(LED_BUILTIN,OUTPUT);
    if(!display.begin(SSD1306_SWITCHCAPVCC)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }
  //display.display();
  //delay(2000); // Pause for 2 seconds
  //display.clearDisplay();
  mainMenu();

}

void loop()
{
  //Verifica se o botao do encoder foi pressionado
  valor = digitalRead(pinoSW);
  if (valor != 1)
  {
    Serial.println("Botao pressionado");
    while (digitalRead(pinoSW) == 0){
    digitalWrite(LED_BUILTIN,0);delay(50);
    digitalWrite(LED_BUILTIN,1);delay(50);
      //delay(10);
    }
  }

  //Le as informacoes do encoder
  static int pos = 0;
  encoder.tick();
  newPos = encoder.getPosition();
  //Se a posicao foi alterada, mostra o valor
  //no Serial Monitor
  if (pos != newPos) {
    Serial.print(newPos);
    Serial.println();
    pos = newPos;
    mainMenu();
  }
}

 void mainMenu(void) {
  display.clearDisplay();

  display.setTextSize(2);             // Draw 2X-scale text
  display.setTextColor(WHITE);
  display.setCursor(20,0);             // Start at top-left corner
  display.println(" MENU");
  //display.drawFastHLine(0,8,128,WHITE);//BLACK

  display.setTextSize(1);             // Draw 2X-scale text
  display.setTextColor(WHITE);
  //display.println(newPos, DEC);
  display.setCursor(10,20);display.print(F("B.T."));
  display.setCursor(10,30);display.print(F("MP3"));
  display.setCursor(10,40);display.print(F("F.M."));
  display.setCursor(10,50);display.print(F("Aux."));
  display.setCursor(2, (newPos * 10) + 20);
  display.println(">");
  
  display.display();
}