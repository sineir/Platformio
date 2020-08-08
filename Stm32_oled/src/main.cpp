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

void inMenu();

/*
Main Menu:0
          Inputs(channel):1
              ->B.T.
              ->MP3
              ->FM
              ->Aux.
          Sound:1
              ->Volume
              ->Bass
              ->Treble
              ->Bal
              ->Gain
          Funcs:2
              -><< prev
              ->|| pause/play/mute
              ->>> next
*/

String menu[] = {"Menu","Inputs","Sound","Funcs"}; // stack:0 idx:0
String inputs[] = {"Inputs","B.T.","MP3","F.M.","Aux","Sair"}; //stack:1 idx:1
String sounds[] = {"Sound","Vol","Bass","Treb","Bal","Gain","Sair"}; //stack:1 idx:2
String funcs[] = {"Funcs","<<","||",">>","Sair"};

unsigned int size[] = {3,5,6,4}; // size of arrays menu,inputs,sounds,funcs
unsigned int memo[] = {1,1,1,1}; // memory selection each arrays
unsigned int mnx = 1; // index work temp to arrays
unsigned int maxi = 0; // load len arrya from size[]
unsigned int idx = 0; // 0:menu 1: inputs 2: sounds
unsigned int idx_prev = 0; // idx previos ????
unsigned int upd = 0; // have change for display
unsigned int stk = 0; //stack control 0:Main Menu 1:inputs and sounds 2:functions<not implement>

String topMenu="";
String optMenu="";
String infoMenu="";

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

  infoMenu=inputs[ memo[mnx] ];
  topMenu = menu[idx];
  optMenu = menu[mnx];
  inMenu();

}

void loop()
{
  //Verifica se o botao do encoder foi pressionado
  valor = digitalRead(pinoSW);
  if (valor != 1)
  {
        upd=1;
    switch (stk) {
      case 0:
        stk=1;
        idx_prev = idx; //save index previous
        idx=mnx; //memo[idx]; //load index next
        mnx = memo[idx];
      break;
      case 1:
      if (optMenu=="Sair") {
        stk=0;
      }else{
        memo[idx] = mnx;
      }

        if(stk==0){
          idx=0; //save index next
          mnx=memo[idx]; //load index previous
        }

      break;
    }

    Serial.println("Botao pressionado");
    while (digitalRead(pinoSW) == 0){
    digitalWrite(LED_BUILTIN,0);delay(50);
    digitalWrite(LED_BUILTIN,1);delay(50);
    //delay(10);
    }
  }

  //read encoder
  static int pos = 0;
  encoder.tick();
  newPos = encoder.getPosition();
  //if change position
  //send monitor serial
  if (pos != newPos) {
    Serial.print(newPos);
    Serial.println();
    
    maxi = size[idx] ;
    //mnx = memo[idx] ;
    if (pos>newPos){
      mnx--;
      if (mnx<1) mnx=1;
    } 
    if (pos<newPos){
      mnx++;
      if (mnx > maxi) mnx= maxi;
    }
    upd=1;
    pos = newPos;
    //memo[idx] = mnx;
    //mainMenu();
  }
  if (upd==1){
    upd=0;

    switch (stk)
    {
    case 0:
      if (mnx==1)infoMenu=inputs[memo[mnx]];
      if (mnx==2)infoMenu=sounds[memo[mnx]];
      if (mnx==3)infoMenu=funcs[memo[mnx]];
      topMenu = menu[0];
      optMenu = menu[mnx];
      inMenu();
      break;
    case 1:
      switch (idx)
      {
      case 1:
      infoMenu = " x ";
      topMenu = inputs[0];
      optMenu = inputs[mnx];
        inMenu();
        break;
      case 2:
        topMenu = sounds[0];
        optMenu = sounds[mnx];
        inMenu();
        break;
      
      case 3:
        topMenu = funcs[0];
        optMenu = funcs[mnx];
        inMenu();
        break;      
      default:
        break;
      }
    break;    
    default:
      break;
    
  }

}

}

 void inMenu() {
  display.clearDisplay();
  display.setTextSize(2);             // Draw 2X-scale text
  display.setTextColor(WHITE);
  
  display.setCursor(20,0);             // Start at top-left corner
  display.println(topMenu);
  display.setCursor(40,30);
  //optMenu = inputs[mnx];
  display.print(optMenu);
  display.setCursor(40,50);
  display.print(mnx, DEC);
  display.print(" ");
  display.print(infoMenu);
  display.display();
}
