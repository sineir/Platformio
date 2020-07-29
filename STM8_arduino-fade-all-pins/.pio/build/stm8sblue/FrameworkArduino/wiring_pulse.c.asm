;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module wiring_pulse
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _micros
	.globl _pulseInLong
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 69: unsigned long pulseInLong(uint8_t pin, uint8_t state, unsigned long timeout)
;	-----------------------------------------
;	 function pulseInLong
;	-----------------------------------------
_pulseInLong:
	sub	sp, #35
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 76: uint8_t bit = digitalPinToBitMask(pin);
	ldw	x, #_digital_pin_to_bit_mask_PGM+0
	ld	a, xl
	add	a, (0x26, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x03, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 77: uint8_t port = digitalPinToPort(pin);
	ldw	x, #_digital_pin_to_port_PGM+0
	ld	a, xl
	add	a, (0x26, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x01, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 78: uint8_t stateMask = (state ? bit : 0);
	tnz	(0x27, sp)
	jreq	00118$
	ld	a, (0x03, sp)
	ld	(0x02, sp), a
	jra	00119$
00118$:
	clr	(0x02, sp)
00119$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 80: unsigned long startMicros = micros();
	call	_micros
	ldw	(0x06, sp), x
	ldw	(0x04, sp), y
	ldw	y, (0x05, sp)
	ldw	(0x05, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 83: while ((*portInputRegister(port) & bit) == stateMask) {
	ldw	x, #_port_to_input_PGM+0
	ldw	(0x0c, sp), x
00103$:
	ld	a, (0x01, sp)
	ld	(0x17, sp), a
	clr	(0x16, sp)
	ldw	x, (0x16, sp)
	sllw	x
	ldw	(0x12, sp), x
	ldw	x, (0x0c, sp)
	addw	x, (0x12, sp)
	ldw	(0x14, sp), x
	ldw	x, (x)
	ldw	(0x22, sp), x
	ldw	y, x
	ldw	(0x18, sp), y
	ldw	x, y
	ld	a, (x)
	and	a, (0x03, sp)
	cp	a, (0x02, sp)
	jrne	00108$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 84: if (micros() - startMicros > timeout)
	call	_micros
	exgw	x, y
	subw	y, (0x06, sp)
	ldw	(0x20, sp), y
	ld	a, xl
	sbc	a, (0x05, sp)
	ld	(0x1f, sp), a
	ld	a, xh
	sbc	a, (0x04, sp)
	ld	(0x1e, sp), a
	ldw	x, (0x2a, sp)
	cpw	x, (0x20, sp)
	ld	a, (0x29, sp)
	sbc	a, (0x1f, sp)
	ld	a, (0x28, sp)
	sbc	a, (0x1e, sp)
	jrnc	00103$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 85: return 0;
	clrw	x
	clrw	y
	jra	00116$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 89: while ((*portInputRegister(port) & bit) != stateMask) {
00108$:
	ldw	x, (0x14, sp)
	ldw	x, (x)
	ld	a, (x)
	and	a, (0x03, sp)
	cp	a, (0x02, sp)
	jreq	00110$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 90: if (micros() - startMicros > timeout)
	call	_micros
	exgw	x, y
	subw	y, (0x06, sp)
	ldw	(0x10, sp), y
	ld	a, xl
	sbc	a, (0x05, sp)
	ld	(0x0f, sp), a
	ld	a, xh
	sbc	a, (0x04, sp)
	ld	(0x0e, sp), a
	ldw	x, (0x2a, sp)
	cpw	x, (0x10, sp)
	ld	a, (0x29, sp)
	sbc	a, (0x0f, sp)
	ld	a, (0x28, sp)
	sbc	a, (0x0e, sp)
	jrnc	00108$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 91: return 0;
	clrw	x
	clrw	y
	jra	00116$
00110$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 94: start = micros();
	call	_micros
	ldw	(0x0a, sp), x
	ldw	(0x08, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 96: while ((*portInputRegister(port) & bit) == stateMask) {
00113$:
	ldw	x, (0x14, sp)
	ldw	x, (x)
	ld	a, (x)
	and	a, (0x03, sp)
	cp	a, (0x02, sp)
	jrne	00115$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 97: if (micros() - startMicros > timeout)
	call	_micros
	exgw	x, y
	subw	y, (0x06, sp)
	ldw	(0x1c, sp), y
	ld	a, xl
	sbc	a, (0x05, sp)
	ld	(0x1b, sp), a
	ld	a, xh
	sbc	a, (0x04, sp)
	ld	(0x1a, sp), a
	ldw	x, (0x2a, sp)
	cpw	x, (0x1c, sp)
	ld	a, (0x29, sp)
	sbc	a, (0x1b, sp)
	ld	a, (0x28, sp)
	sbc	a, (0x1a, sp)
	jrnc	00113$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 98: return 0;
	clrw	x
	clrw	y
	jra	00116$
00115$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_pulse.c: 100: return micros() - start;
	call	_micros
	exgw	x, y
	subw	y, (0x0a, sp)
	ld	a, xl
	sbc	a, (0x09, sp)
	rlwa	x
	sbc	a, (0x08, sp)
	ld	xh, a
	exgw	x, y
00116$:
	addw	sp, #35
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
