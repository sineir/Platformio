;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module wiring_analog
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _digitalWrite
	.globl _pinMode
	.globl _analogRead
	.globl _analogWrite
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 44: int analogRead(uint8_t pin)
;	-----------------------------------------
;	 function analogRead
;	-----------------------------------------
_analogRead:
	sub	sp, #6
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 49: pin = analogPinToChannel(pin);
	ld	a, (0x09, sp)
	cp	a, #0x06
	jrnc	00106$
	ld	a, (0x09, sp)
	jra	00107$
00106$:
	ldw	x, #_digitalPinToAnalogChannelMap+0
	ldw	(0x01, sp), x
	clrw	x
	ld	a, (0x09, sp)
	ld	xl, a
	subw	x, #0x0006
	addw	x, (0x01, sp)
	ld	a, (x)
00107$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 77: ADC1->CSR = pin & 15;
	and	a, #0x0f
	ldw	x, #0x5400
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 78: bitSet(ADC1->CR2, 3);	// right align
	ldw	x, #0x5402
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 88: ADC1->CR1 |= ADC1_CR1_ADON;
	bset	0x5401, #0
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 92: ADC1->CR1 |= ADC1_CR1_ADON;
	bset	0x5401, #0
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 95: while (! (ADC1->CSR & ADC1_FLAG_EOC));
00101$:
	ldw	x, #0x5400
	ld	a, (x)
	tnz	a
	jrpl	00101$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 96: ADC1->CSR &= ~(ADC1_FLAG_EOC);	// important! clear the flag
	bres	0x5400, #7
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 99: low  = ADC1->DRL;
	ldw	x, #0x5405
	ld	a, (x)
	ld	yh, a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 100: high = ADC1->DRH;
	ldw	x, #0x5404
	ld	a, (x)
	ld	yl, a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 103: bitClear(ADC1->CR1, 0);
	bres	0x5401, #0
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 126: return (high << 8) | low;
	clr	a
	clr	(0x04, sp)
	ld	a, yh
	clr	(0x05, sp)
	or	a, (0x04, sp)
	ld	xl, a
	ld	a, yl
	or	a, (0x05, sp)
	ld	xh, a
	addw	sp, #6
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 138: void analogWrite(uint8_t pin, int val)
;	-----------------------------------------
;	 function analogWrite
;	-----------------------------------------
_analogWrite:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 147: pinMode(pin, OUTPUT);
	push	#0x01
	ld	a, (0x04, sp)
	push	a
	call	_pinMode
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 148: if (val == 0)
	ldw	x, (0x04, sp)
	jrne	00116$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 150: digitalWrite(pin, LOW);
	push	#0x00
	ld	a, (0x04, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
	ret
00116$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 152: else if (val >= 255)
	ldw	x, (0x04, sp)
	cpw	x, #0x00ff
	jrslt	00113$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 154: digitalWrite(pin, HIGH);
	push	#0x01
	ld	a, (0x04, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
	ret
00113$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 158: switch(digitalPinToTimer(pin))
	ldw	x, #_digital_pin_to_timer_PGM+0
	ld	a, xl
	add	a, (0x03, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
	cp	a, #0x05
	jrule	00138$
	jp	00107$
00138$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 237: TIM1->CCR3L = (uint8_t)(val);
	exg	a, yl
	ld	a, (0x05, sp)
	exg	a, yl
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 158: switch(digitalPinToTimer(pin))
	clrw	x
	ld	xl, a
	sllw	x
	ldw	x, (#00139$, x)
	jp	(x)
00139$:
	.dw	#00106$
	.dw	#00101$
	.dw	#00102$
	.dw	#00103$
	.dw	#00104$
	.dw	#00105$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 214: case TIMER13:
00101$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 234: TIM1->CCER2 |= TIM2_CCER2_CC3E;
	bset	0x525d, #0
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 235: TIM1->CCMR3 = TIM1_OCMODE_PWM1 | TIM1_CCMR_OCxPE;
	mov	0x525a+0, #0x68
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 236: TIM1->CCR3H = 0;
	mov	0x5269+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 237: TIM1->CCR3L = (uint8_t)(val);
	ldw	x, #0x526a
	ld	a, yl
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 239: break;
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 240: case TIMER14:
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 252: tmp = TIM1->CCER2 & (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
	ldw	x, #0x525d
	ld	a, (x)
	and	a, #0xcf
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 253: TIM1->CCER2 = tmp | TIM1_CCER2_CC4E;
	or	a, #0x10
	ldw	x, #0x525d
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 254: TIM1->CCMR4 = TIM1_OCMODE_PWM1 | TIM1_CCMR_OCxPE;
	mov	0x525b+0, #0x68
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 255: TIM1->CCR4H = 0;
	mov	0x526b+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 256: TIM1->CCR4L = (uint8_t)(val);
	ldw	x, #0x526c
	ld	a, yl
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 258: break;
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 259: case TIMER21:
00103$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 272: TIM2->CCER1 |= TIM2_CCER1_CC1E;
	bset	0x530a, #0
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 273: TIM2->CCMR1 = TIM2_OCMODE_PWM1 | TIM2_CCMR_OCxPE;
	mov	0x5307+0, #0x68
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 274: TIM2->CCR1H = 0;
	mov	0x5311+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 275: TIM2->CCR1L = (uint8_t)(val);
	ldw	x, #0x5312
	ld	a, yl
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 277: break;
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 278: case TIMER22:
00104$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 290: TIM2->CCMR2 = TIM2_OCMODE_PWM1 | TIM2_CCMR_OCxPE;
	mov	0x5308+0, #0x68
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 291: TIM2->CCER1 |= TIM2_CCER1_CC2E;
	ldw	x, #0x530a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 292: TIM2->CCR2H = 0;
	mov	0x5313+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 293: TIM2->CCR2L = (uint8_t)(val);
	ldw	x, #0x5314
	ld	a, yl
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 295: break;
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 297: case TIMER23:
00105$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 308: tmp = TIM2->CCER2 & (uint8_t)(~(TIM2_CCER2_CC3E | TIM2_CCER2_CC3P));
	ldw	x, #0x530b
	ld	a, (x)
	and	a, #0xfc
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 309: TIM2->CCER2 = tmp | TIM2_CCER2_CC3E;
	or	a, #0x01
	ldw	x, #0x530b
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 311: TIM2->CCMR3 = TIM2_OCMODE_PWM1 | TIM2_CCMR_OCxPE;
	mov	0x5309+0, #0x68
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 312: TIM2->CCR3H = 0;
	mov	0x5315+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 313: TIM2->CCR3L = (uint8_t)(val);
	ldw	x, #0x5316
	ld	a, yl
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 315: break;
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 335: case NOT_ON_TIMER:
00106$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 336: default:
00107$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 337: if (val < 128) {
	ldw	x, (0x04, sp)
	cpw	x, #0x0080
	jrsge	00109$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 338: digitalWrite(pin, LOW);
	push	#0x00
	ld	a, (0x04, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
	ret
00109$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 340: digitalWrite(pin, HIGH);
	push	#0x01
	ld	a, (0x04, sp)
	push	a
	call	_digitalWrite
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring_analog.c: 342: }
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
