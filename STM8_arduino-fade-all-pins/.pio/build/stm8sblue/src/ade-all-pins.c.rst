                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.3 #9771 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module ade_all_pins
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _delay
                                     12 	.globl _analogWrite
                                     13 	.globl _pinMode
                                     14 	.globl _fadeAmount
                                     15 	.globl _brightness
                                     16 	.globl _i
                                     17 	.globl _setup
                                     18 	.globl _loop
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
      000001                         23 _i::
      000001                         24 	.ds 1
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
      000036                         29 _brightness::
      000036                         30 	.ds 2
      000038                         31 _fadeAmount::
      000038                         32 	.ds 2
                                     33 ;--------------------------------------------------------
                                     34 ; absolute external ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DABS (ABS)
                                     37 ;--------------------------------------------------------
                                     38 ; global & static initialisations
                                     39 ;--------------------------------------------------------
                                     40 	.area HOME
                                     41 	.area GSINIT
                                     42 	.area GSFINAL
                                     43 	.area GSINIT
                                     44 ;--------------------------------------------------------
                                     45 ; Home
                                     46 ;--------------------------------------------------------
                                     47 	.area HOME
                                     48 	.area HOME
                                     49 ;--------------------------------------------------------
                                     50 ; code
                                     51 ;--------------------------------------------------------
                                     52 	.area CODE
                                     53 ;	src\ade-all-pins.c: 17: void setup()  {
                                     54 ;	-----------------------------------------
                                     55 ;	 function setup
                                     56 ;	-----------------------------------------
      0080A0                         57 _setup:
                                     58 ;	src\ade-all-pins.c: 19: for (i=0; i<NUM_DIGITAL_PINS; i++) pinMode(i,OUTPUT);
      0080A0 72 5F 00 01      [ 1]   59 	clr	_i+0
      0080A4                         60 00102$:
      0080A4 4B 01            [ 1]   61 	push	#0x01
      0080A6 3B 00 01         [ 1]   62 	push	_i+0
      0080A9 CD 82 3F         [ 4]   63 	call	_pinMode
      0080AC 5B 02            [ 2]   64 	addw	sp, #2
      0080AE C6 00 01         [ 1]   65 	ld	a, _i+0
      0080B1 4C               [ 1]   66 	inc	a
      0080B2 C7 00 01         [ 1]   67 	ld	_i+0, a
      0080B5 A1 10            [ 1]   68 	cp	a, #0x10
      0080B7 25 EB            [ 1]   69 	jrc	00102$
      0080B9 81               [ 4]   70 	ret
                                     71 ;	src\ade-all-pins.c: 23: void loop()  {
                                     72 ;	-----------------------------------------
                                     73 ;	 function loop
                                     74 ;	-----------------------------------------
      0080BA                         75 _loop:
                                     76 ;	src\ade-all-pins.c: 25: for (i=0; i<NUM_DIGITAL_PINS; i++) analogWrite(i,brightness);
      0080BA 72 5F 00 01      [ 1]   77 	clr	_i+0
      0080BE                         78 00105$:
      0080BE 3B 00 37         [ 1]   79 	push	_brightness+1
      0080C1 3B 00 36         [ 1]   80 	push	_brightness+0
      0080C4 3B 00 01         [ 1]   81 	push	_i+0
      0080C7 CD 81 5C         [ 4]   82 	call	_analogWrite
      0080CA 5B 03            [ 2]   83 	addw	sp, #3
      0080CC C6 00 01         [ 1]   84 	ld	a, _i+0
      0080CF 4C               [ 1]   85 	inc	a
      0080D0 C7 00 01         [ 1]   86 	ld	_i+0, a
      0080D3 A1 10            [ 1]   87 	cp	a, #0x10
      0080D5 25 E7            [ 1]   88 	jrc	00105$
                                     89 ;	src\ade-all-pins.c: 28: brightness = brightness + fadeAmount;
      0080D7 CE 00 36         [ 2]   90 	ldw	x, _brightness+0
      0080DA 72 BB 00 38      [ 2]   91 	addw	x, _fadeAmount+0
                                     92 ;	src\ade-all-pins.c: 31: if (brightness == 0 || brightness == 255) {
      0080DE CF 00 36         [ 2]   93 	ldw	_brightness+0, x
      0080E1 27 08            [ 1]   94 	jreq	00102$
      0080E3 CE 00 36         [ 2]   95 	ldw	x, _brightness+0
      0080E6 A3 00 FF         [ 2]   96 	cpw	x, #0x00ff
      0080E9 26 07            [ 1]   97 	jrne	00103$
      0080EB                         98 00102$:
                                     99 ;	src\ade-all-pins.c: 32: fadeAmount = -fadeAmount ; 
      0080EB CE 00 38         [ 2]  100 	ldw	x, _fadeAmount+0
      0080EE 50               [ 2]  101 	negw	x
      0080EF CF 00 38         [ 2]  102 	ldw	_fadeAmount+0, x
      0080F2                        103 00103$:
                                    104 ;	src\ade-all-pins.c: 35: delay(30);                            
      0080F2 4B 1E            [ 1]  105 	push	#0x1e
      0080F4 5F               [ 1]  106 	clrw	x
      0080F5 89               [ 2]  107 	pushw	x
      0080F6 4B 00            [ 1]  108 	push	#0x00
      0080F8 CD 85 34         [ 4]  109 	call	_delay
      0080FB 5B 04            [ 2]  110 	addw	sp, #4
      0080FD 81               [ 4]  111 	ret
                                    112 	.area CODE
                                    113 	.area INITIALIZER
      008C7D                        114 __xinit__brightness:
      008C7D 00 00                  115 	.dw #0x0000
      008C7F                        116 __xinit__fadeAmount:
      008C7F 00 05                  117 	.dw #0x0005
                                    118 	.area CABS (ABS)
