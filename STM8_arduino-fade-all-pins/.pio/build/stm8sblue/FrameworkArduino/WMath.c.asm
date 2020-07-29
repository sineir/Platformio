;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module WMath
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _map
	.globl _random_minmax
	.globl _random
	.globl _randomSeed
	.globl _srand
	.globl _rand
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 32: void randomSeed(unsigned long seed)
;	-----------------------------------------
;	 function randomSeed
;	-----------------------------------------
_randomSeed:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 34: if (seed != 0) {
	ldw	x, (0x05, sp)
	jrne	00109$
	ldw	x, (0x03, sp)
	jrne	00109$
	ret
00109$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 35: srand(seed);
	ldw	x, (0x05, sp)
	pushw	x
	call	_srand
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 39: long random(long howbig)
;	-----------------------------------------
;	 function random
;	-----------------------------------------
_random:
	sub	sp, #4
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 41: if (howbig == 0) {
	ldw	x, (0x09, sp)
	jrne	00102$
	ldw	x, (0x07, sp)
	jrne	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 42: return 0;
	clrw	x
	clrw	y
	jra	00103$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 44: return rand() % howbig;
	call	_rand
	ld	a, xh
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x02, sp), a
	ld	(0x01, sp), a
	ldw	y, (0x09, sp)
	pushw	y
	ldw	y, (0x09, sp)
	pushw	y
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__modslong
	addw	sp, #8
00103$:
	addw	sp, #4
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 47: long random_minmax(long howsmall, long howbig)
;	-----------------------------------------
;	 function random_minmax
;	-----------------------------------------
_random_minmax:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 51: if (howsmall >= howbig) {
	ldw	x, (0x05, sp)
	cpw	x, (0x09, sp)
	ld	a, (0x04, sp)
	sbc	a, (0x08, sp)
	ld	a, (0x03, sp)
	sbc	a, (0x07, sp)
	jrslt	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 52: return howsmall;
	ldw	x, (0x05, sp)
	ldw	y, (0x03, sp)
	ret
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 54: diff = howbig - howsmall;
	ldw	y, (0x09, sp)
	subw	y, (0x05, sp)
	ld	a, (0x08, sp)
	sbc	a, (0x04, sp)
	ld	xl, a
	ld	a, (0x07, sp)
	sbc	a, (0x03, sp)
	ld	xh, a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 55: return random(diff) + howsmall;
	pushw	y
	pushw	x
	call	_random
	addw	sp, #4
	exgw	x, y
	addw	y, (0x05, sp)
	ld	a, xl
	adc	a, (0x04, sp)
	rlwa	x
	adc	a, (0x03, sp)
	ld	xh, a
	exgw	x, y
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 58: long map(long x, long in_min, long in_max, long out_min, long out_max)
;	-----------------------------------------
;	 function map
;	-----------------------------------------
_map:
	sub	sp, #12
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WMath.c: 60: return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
	ldw	y, (0x11, sp)
	subw	y, (0x15, sp)
	ld	a, (0x10, sp)
	sbc	a, (0x14, sp)
	ld	(0x02, sp), a
	ld	a, (0x0f, sp)
	sbc	a, (0x13, sp)
	ld	(0x01, sp), a
	ldw	x, (0x21, sp)
	subw	x, (0x1d, sp)
	ld	a, (0x20, sp)
	sbc	a, (0x1c, sp)
	ld	(0x06, sp), a
	ld	a, (0x1f, sp)
	sbc	a, (0x1b, sp)
	ld	(0x05, sp), a
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	call	__mullong
	addw	sp, #8
	ldw	(0x0b, sp), x
	ldw	(0x09, sp), y
	ldw	y, (0x19, sp)
	subw	y, (0x15, sp)
	ld	a, (0x18, sp)
	sbc	a, (0x14, sp)
	ld	xl, a
	ld	a, (0x17, sp)
	sbc	a, (0x13, sp)
	ld	xh, a
	pushw	y
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	call	__divslong
	addw	sp, #8
	exgw	x, y
	addw	y, (0x1d, sp)
	ld	a, xl
	adc	a, (0x1c, sp)
	rlwa	x
	adc	a, (0x1b, sp)
	ld	xh, a
	exgw	x, y
	addw	sp, #12
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
