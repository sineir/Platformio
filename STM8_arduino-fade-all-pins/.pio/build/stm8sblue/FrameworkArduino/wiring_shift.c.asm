;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module wiring_shift
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _digitalRead
	.globl _digitalWrite
	.globl _shiftIn
	.globl _shiftOut
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 25: uint8_t shiftIn(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder) {
;	-----------------------------------------
;	 function shiftIn
;	-----------------------------------------
_shiftIn:
	sub	sp, #3
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 26: uint8_t value = 0;
	clr	(0x02, sp)
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 29: for (i = 0; i < 8; ++i) {
	clr	(0x01, sp)
00105$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 30: digitalWrite(clockPin, HIGH);
	push	#0x01
	ld	a, (0x08, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 32: value |= digitalRead(dataPin) << i;
	ld	a, (0x02, sp)
	ld	(0x03, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 31: if (bitOrder == LSBFIRST)
	tnz	(0x08, sp)
	jrne	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 32: value |= digitalRead(dataPin) << i;
	ld	a, (0x06, sp)
	push	a
	call	_digitalRead
	pop	a
	ld	a, xl
	push	a
	ld	a, (0x02, sp)
	jreq	00124$
00123$:
	sll	(1, sp)
	dec	a
	jrne	00123$
00124$:
	pop	a
	or	a, (0x03, sp)
	ld	(0x02, sp), a
	jra	00103$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 34: value |= digitalRead(dataPin) << (7 - i);
	ld	a, (0x06, sp)
	push	a
	call	_digitalRead
	pop	a
	ld	a, #0x07
	sub	a, (0x01, sp)
	ld	xh, a
	ld	a, xl
	push	a
	ld	a, xh
	tnz	a
	jreq	00126$
00125$:
	sll	(1, sp)
	dec	a
	jrne	00125$
00126$:
	pop	a
	or	a, (0x03, sp)
	ld	(0x02, sp), a
00103$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 35: digitalWrite(clockPin, LOW);
	push	#0x00
	ld	a, (0x08, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 29: for (i = 0; i < 8; ++i) {
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00105$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 37: return value;
	ld	a, (0x02, sp)
	addw	sp, #3
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 40: void shiftOut(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder, uint8_t val)
;	-----------------------------------------
;	 function shiftOut
;	-----------------------------------------
_shiftOut:
	sub	sp, #7
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 44: for (i = 0; i < 8; i++)  {
	clr	(0x01, sp)
00105$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 46: digitalWrite(dataPin, !!(val & (1 << i)));
	ld	a, (0x0d, sp)
	ld	(0x05, sp), a
	clr	(0x04, sp)
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 45: if (bitOrder == LSBFIRST)
	tnz	(0x0c, sp)
	jrne	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 46: digitalWrite(dataPin, !!(val & (1 << i)));
	ldw	x, #0x0001
	ld	a, (0x01, sp)
	jreq	00132$
00131$:
	sllw	x
	dec	a
	jrne	00131$
00132$:
	ld	a, xl
	and	a, (0x05, sp)
	rlwa	x
	and	a, (0x04, sp)
	ld	xh, a
	tnzw	x
	jreq	00109$
	ld	a, #0x01
	.byte 0x21
00109$:
	clr	a
00110$:
	push	a
	ld	a, (0x0b, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
	jra	00103$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 48: digitalWrite(dataPin, !!(val & (1 << (7 - i))));
	ld	a, (0x01, sp)
	ld	(0x07, sp), a
	clr	(0x06, sp)
	ldw	y, #0x0007
	subw	y, (0x06, sp)
	ldw	x, #0x0001
	ld	a, yl
	tnz	a
	jreq	00135$
00134$:
	sllw	x
	dec	a
	jrne	00134$
00135$:
	ld	a, xl
	and	a, (0x05, sp)
	ld	(0x03, sp), a
	ld	a, xh
	and	a, (0x04, sp)
	ld	(0x02, sp), a
	ldw	x, (0x02, sp)
	jreq	00111$
	ld	a, #0x01
	.byte 0x21
00111$:
	clr	a
00112$:
	push	a
	ld	a, (0x0b, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
00103$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 50: digitalWrite(clockPin, HIGH);
	push	#0x01
	ld	a, (0x0c, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 51: digitalWrite(clockPin, LOW);		
	push	#0x00
	ld	a, (0x0c, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_shift.c: 44: for (i = 0; i < 8; i++)  {
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrnc	00137$
	jp	00105$
00137$:
	addw	sp, #7
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
