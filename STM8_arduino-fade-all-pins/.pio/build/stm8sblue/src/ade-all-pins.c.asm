;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module ade_all_pins
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _delay
	.globl _analogWrite
	.globl _pinMode
	.globl _fadeAmount
	.globl _brightness
	.globl _i
	.globl _setup
	.globl _loop
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_i::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_brightness::
	.ds 2
_fadeAmount::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	src\ade-all-pins.c: 17: void setup()  {
;	-----------------------------------------
;	 function setup
;	-----------------------------------------
_setup:
;	src\ade-all-pins.c: 19: for (i=0; i<NUM_DIGITAL_PINS; i++) pinMode(i,OUTPUT);
	clr	_i+0
00102$:
	push	#0x01
	push	_i+0
	call	_pinMode
	addw	sp, #2
	ld	a, _i+0
	inc	a
	ld	_i+0, a
	cp	a, #0x10
	jrc	00102$
	ret
;	src\ade-all-pins.c: 23: void loop()  {
;	-----------------------------------------
;	 function loop
;	-----------------------------------------
_loop:
;	src\ade-all-pins.c: 25: for (i=0; i<NUM_DIGITAL_PINS; i++) analogWrite(i,brightness);
	clr	_i+0
00105$:
	push	_brightness+1
	push	_brightness+0
	push	_i+0
	call	_analogWrite
	addw	sp, #3
	ld	a, _i+0
	inc	a
	ld	_i+0, a
	cp	a, #0x10
	jrc	00105$
;	src\ade-all-pins.c: 28: brightness = brightness + fadeAmount;
	ldw	x, _brightness+0
	addw	x, _fadeAmount+0
;	src\ade-all-pins.c: 31: if (brightness == 0 || brightness == 255) {
	ldw	_brightness+0, x
	jreq	00102$
	ldw	x, _brightness+0
	cpw	x, #0x00ff
	jrne	00103$
00102$:
;	src\ade-all-pins.c: 32: fadeAmount = -fadeAmount ; 
	ldw	x, _fadeAmount+0
	negw	x
	ldw	_fadeAmount+0, x
00103$:
;	src\ade-all-pins.c: 35: delay(30);                            
	push	#0x1e
	clrw	x
	pushw	x
	push	#0x00
	call	_delay
	addw	sp, #4
	ret
	.area CODE
	.area INITIALIZER
__xinit__brightness:
	.dw #0x0000
__xinit__fadeAmount:
	.dw #0x0005
	.area CABS (ABS)
