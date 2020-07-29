;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module wiring_digital
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ccmrx
	.globl _digitalPinToAnalogChannelMap
	.globl _digital_pin_to_timer_PGM
	.globl _digital_pin_to_bit_mask_PGM
	.globl _digital_pin_to_port_PGM
	.globl _port_to_input_PGM
	.globl _port_to_output_PGM
	.globl _port_to_mode_PGM
	.globl _pinMode
	.globl _digitalWrite
	.globl _digitalRead
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 89: void pinMode(uint8_t pin, uint8_t mode)
;	-----------------------------------------
;	 function pinMode
;	-----------------------------------------
_pinMode:
	sub	sp, #16
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 91: uint8_t bit = digitalPinToBitMask(pin);
	ldw	x, #_digital_pin_to_bit_mask_PGM+0
	ld	a, xl
	add	a, (0x13, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x04, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 92: uint8_t port = digitalPinToPort(pin);
	ldw	x, #_digital_pin_to_port_PGM+0
	ld	a, xl
	add	a, (0x13, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x01, sp)
	ld	(0x05, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 95: if (port == NOT_A_PIN) return;
	tnz	(0x01, sp)
	jrne	00102$
	jp	00118$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 97: gpio = (GPIO_TypeDef *) portOutputRegister(port);
	ldw	x, #_port_to_output_PGM+0
	ldw	(0x0b, sp), x
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	sllw	x
	addw	x, (0x0b, sp)
	ldw	x, (x)
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 101: gpio->CR2 &= ~bit;	// first: deactivate interrupt
	ldw	(0x0f, sp), x
	addw	x, #0x0004
	ldw	(0x09, sp), x
	ld	a, (0x04, sp)
	cpl	a
	ld	(0x06, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 102: gpio->CR1 &= ~bit;	// release top side
	ldw	x, (0x0f, sp)
	addw	x, #0x0003
	ldw	(0x07, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 103: gpio->DDR &= ~bit;	// now set direction
	ldw	x, (0x0f, sp)
	incw	x
	incw	x
	ldw	(0x0d, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 99: if (mode == INPUT) {
	tnz	(0x14, sp)
	jrne	00116$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 104: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 101: gpio->CR2 &= ~bit;	// first: deactivate interrupt
	ldw	x, (0x09, sp)
	ld	a, (x)
	and	a, (0x06, sp)
	ldw	x, (0x09, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 102: gpio->CR1 &= ~bit;	// release top side
	ldw	x, (0x07, sp)
	ld	a, (x)
	and	a, (0x06, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 103: gpio->DDR &= ~bit;	// now set direction
	ldw	x, (0x0d, sp)
	ld	a, (x)
	and	a, (0x06, sp)
	ldw	x, (0x0d, sp)
	ld	(x), a
	rim
	jp	00118$
00116$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 105: } else if (mode == INPUT_PULLUP) {
	ld	a, (0x14, sp)
	cp	a, #0x02
	jrne	00113$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 110: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 107: gpio->CR2 &= ~bit;	// first: deactivate interrupt
	ldw	x, (0x09, sp)
	ld	a, (x)
	and	a, (0x06, sp)
	ldw	x, (0x09, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 108: gpio->DDR &= ~bit;	// set direction before
	ldw	x, (0x0d, sp)
	ld	a, (x)
	and	a, (0x06, sp)
	ldw	x, (0x0d, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 109: gpio->CR1 |=  bit;	// activating the pull up
	ldw	x, (0x07, sp)
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
	rim
	jp	00118$
00113$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 111: } else if (mode == OUTPUT_FAST) {// output push-pull, fast
	ld	a, (0x14, sp)
	cp	a, #0x05
	jrne	00110$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 116: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 113: gpio->CR1 |=  bit;
	ldw	x, (0x07, sp)
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 114: gpio->DDR |=  bit;	// direction before setting CR2 to
	ldw	x, (0x0d, sp)
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, (0x0d, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 115: gpio->CR2 |=  bit;	// avoid accidental interrupt
	ldw	x, (0x09, sp)
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, (0x09, sp)
	ld	(x), a
	rim
	jra	00118$
00110$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 117: } else if (mode == OUTPUT_OD_FAST) {	// output open drain, fast
	ld	a, (0x14, sp)
	cp	a, #0x07
	jrne	00107$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 122: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 119: gpio->CR1 &= ~bit;
	ldw	x, (0x07, sp)
	ld	a, (x)
	and	a, (0x06, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 120: gpio->DDR |=  bit;	// direction before setting CR2 to
	ldw	x, (0x0d, sp)
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, (0x0d, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 121: gpio->CR2 |=  bit;	// avoid accidental interrupt
	ldw	x, (0x09, sp)
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, (0x09, sp)
	ld	(x), a
	rim
	jra	00118$
00107$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 123: } else if (mode == OUTPUT_OD) {	// output open drain, slow
	ld	a, (0x14, sp)
	cp	a, #0x03
	jrne	00104$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 128: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 125: gpio->CR1 &= ~bit;
	ldw	x, (0x07, sp)
	ld	a, (x)
	and	a, (0x06, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 126: gpio->CR2 &= ~bit;
	ldw	x, (0x09, sp)
	ld	a, (x)
	and	a, (0x06, sp)
	ldw	x, (0x09, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 127: gpio->DDR |=  bit;
	ldw	x, (0x0d, sp)
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, (0x0d, sp)
	ld	(x), a
	rim
	jra	00118$
00104$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 134: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 131: gpio->CR1 |=  bit;
	ldw	x, (0x07, sp)
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, (0x07, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 132: gpio->CR2 &= ~bit;
	ldw	x, (0x09, sp)
	ld	a, (x)
	and	a, (0x06, sp)
	ldw	x, (0x09, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 133: gpio->DDR |=  bit;
	ldw	x, (0x0d, sp)
	ld	a, (x)
	or	a, (0x04, sp)
	ldw	x, (0x0d, sp)
	ld	(x), a
	rim
00118$:
	addw	sp, #16
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 174: static void turnOffPWM(uint8_t timer)
;	-----------------------------------------
;	 function turnOffPWM
;	-----------------------------------------
_turnOffPWM:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 176: *((unsigned char *) ccmrx[timer-1]) &= ~TIM1_CCMR_OCM;
	ldw	x, #_ccmrx+0
	ldw	(0x01, sp), x
	ld	a, (0x05, sp)
	dec	a
	clrw	x
	ld	xl, a
	sllw	x
	addw	x, (0x01, sp)
	ldw	x, (x)
	ld	a, (x)
	and	a, #0x8f
	ld	(x), a
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 180: void digitalWrite(uint8_t pin, uint8_t val)
;	-----------------------------------------
;	 function digitalWrite
;	-----------------------------------------
_digitalWrite:
	sub	sp, #8
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 182: uint8_t timer = digitalPinToTimer(pin);
	ldw	x, #_digital_pin_to_timer_PGM+0
	ld	a, xl
	add	a, (0x0b, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x01, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 183: uint8_t bit = digitalPinToBitMask(pin);
	ldw	x, #_digital_pin_to_bit_mask_PGM+0
	ld	a, xl
	add	a, (0x0b, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x02, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 184: uint8_t port = digitalPinToPort(pin);
	ldw	x, #_digital_pin_to_port_PGM+0
	ld	a, xl
	add	a, (0x0b, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x05, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 187: if (port == NOT_A_PIN) return;
	tnz	a
	jreq	00108$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 191: if (timer != NOT_ON_TIMER) turnOffPWM(timer);
	tnz	(0x01, sp)
	jreq	00104$
	ld	a, (0x01, sp)
	push	a
	call	_turnOffPWM
	pop	a
00104$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 193: out = portOutputRegister(port);
	ldw	y, #_port_to_output_PGM+0
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	sllw	x
	ldw	(0x06, sp), x
	addw	y, (0x06, sp)
	ldw	y, (y)
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 203: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 197: if (val == LOW) {
	tnz	(0x0c, sp)
	jrne	00106$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 198: *out &= ~bit;
	ld	a, (y)
	ld	(0x08, sp), a
	ld	a, (0x02, sp)
	cpl	a
	and	a, (0x08, sp)
	ld	(y), a
	jra	00107$
00106$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 200: *out |= bit;
	ld	a, (y)
	or	a, (0x02, sp)
	ld	(y), a
00107$:
	rim
00108$:
	addw	sp, #8
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 206: int digitalRead(uint8_t pin)
;	-----------------------------------------
;	 function digitalRead
;	-----------------------------------------
_digitalRead:
	sub	sp, #5
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 208: uint8_t timer = digitalPinToTimer(pin);
	ldw	x, #_digital_pin_to_timer_PGM+0
	ld	a, xl
	add	a, (0x08, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x02, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 209: uint8_t bit = digitalPinToBitMask(pin);
	ldw	x, #_digital_pin_to_bit_mask_PGM+0
	ld	a, xl
	add	a, (0x08, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x01, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 210: uint8_t port = digitalPinToPort(pin);
	ldw	x, #_digital_pin_to_port_PGM+0
	ld	a, xl
	add	a, (0x08, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	ld	(0x05, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 212: if (port == NOT_A_PIN) return LOW;
	tnz	a
	jrne	00102$
	clrw	x
	jra	00107$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 216: if (timer != NOT_ON_TIMER) turnOffPWM(timer);
	tnz	(0x02, sp)
	jreq	00104$
	ld	a, (0x02, sp)
	push	a
	call	_turnOffPWM
	pop	a
00104$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 218: if (*portInputRegister(port) & bit) return HIGH;
	ldw	y, #_port_to_input_PGM+0
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	sllw	x
	ldw	(0x03, sp), x
	addw	y, (0x03, sp)
	ldw	y, (y)
	ld	a, (y)
	and	a, (0x01, sp)
	tnz	a
	jreq	00106$
	ldw	x, #0x0001
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_digital.c: 219: return LOW;
	.byte 0x21
00106$:
	clrw	x
00107$:
	addw	sp, #5
	ret
	.area CODE
_port_to_mode_PGM:
	.dw #0x0000
	.dw #0x5002
	.dw #0x5007
	.dw #0x500c
	.dw #0x5011
_port_to_output_PGM:
	.dw #0x0000
	.dw #0x5000
	.dw #0x5005
	.dw #0x500a
	.dw #0x500f
_port_to_input_PGM:
	.dw #0x0000
	.dw #0x5001
	.dw #0x5006
	.dw #0x500b
	.dw #0x5010
_digital_pin_to_port_PGM:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
_digital_pin_to_bit_mask_PGM:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
_digital_pin_to_timer_PGM:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
_digitalPinToAnalogChannelMap:
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0x06	; 6
_ccmrx:
	.dw 0x525A
	.dw 0x525B
	.dw 0x5307
	.dw 0x5308
	.dw 0x5309
	.db 0x00
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
