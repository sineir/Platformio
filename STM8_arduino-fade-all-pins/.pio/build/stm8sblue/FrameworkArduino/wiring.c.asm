;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module wiring
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _loop
	.globl _setup
	.globl _serialEvent
	.globl _initVariant
	.globl _UART1_DeInit
	.globl _TIM4_DeInit
	.globl _TIM2_TimeBaseInit
	.globl _TIM2_DeInit
	.globl _TIM1_TimeBaseInit
	.globl _TIM1_DeInit
	.globl _GPIO_DeInit
	.globl _ADC1_DeInit
	.globl _runSerialEvent
	.globl _timer4_millis
	.globl _timer4_overflow_count
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _millis
	.globl _micros
	.globl _delay
	.globl _delayMicroseconds
	.globl _init
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_timer4_overflow_count::
	.ds 4
_timer4_millis::
	.ds 4
_timer4_fract:
	.ds 1
_runSerialEvent::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int _EXTI_PORTA_IRQHandler ;int3
	int _EXTI_PORTB_IRQHandler ;int4
	int _EXTI_PORTC_IRQHandler ;int5
	int _EXTI_PORTD_IRQHandler ;int6
	int _EXTI_PORTE_IRQHandler ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int _TIM1_CAP_COM_IRQHandler ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int _UART1_TX_IRQHandler ;int17
	int _UART1_RX_IRQHandler ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int _TIM4_UPD_OVF_IRQHandler ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 81: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, ITC_IRQ_TIM4_OVF) /* TIM4 UPD/OVF */
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 85: unsigned long m = timer4_millis;
	ldw	y, _timer4_millis+2
	ldw	x, _timer4_millis+0
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 90: m += MILLIS_INC;
	addw	y, #0x0001
	ld	a, xl
	adc	a, #0x00
	rlwa	x
	adc	a, #0x00
	ld	xh, a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 100: timer4_millis = m;
	ldw	_timer4_millis+2, y
	ldw	_timer4_millis+0, x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 101: timer4_overflow_count++;
	ldw	x, _timer4_overflow_count+2
	addw	x, #0x0001
	ld	a, _timer4_overflow_count+1
	adc	a, #0x00
	ld	yl, a
	ld	a, _timer4_overflow_count+0
	adc	a, #0x00
	ld	yh, a
	ldw	_timer4_overflow_count+2, x
	ldw	_timer4_overflow_count+0, y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 107: TIM4->SR1 = (uint8_t)(~TIM4_IT_UPDATE);
	mov	0x5344+0, #0xfe
	iret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 111: unsigned long millis()
;	-----------------------------------------
;	 function millis
;	-----------------------------------------
_millis:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 119: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 118: m = timer4_millis;
	ldw	x, _timer4_millis+2
	ldw	y, _timer4_millis+0
	rim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 121: return m;
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 125: unsigned long micros()
;	-----------------------------------------
;	 function micros
;	-----------------------------------------
_micros:
	sub	sp, #13
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 160: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 153: m = timer4_overflow_count;
	ldw	y, _timer4_overflow_count+2
	ldw	x, _timer4_overflow_count+0
	ldw	(0x0a, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 154: t = TIM4->CNTR;
	ldw	x, #0x5346
	ld	a, (x)
	ld	(0x01, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 158: if ((TIM4->SR1 & (uint8_t)TIM4_IT_UPDATE) && (t < (T4PERIOD-1)))
	ldw	x, #0x5344
	ld	a, (x)
	srl	a
	jrnc	00102$
	ld	a, (0x01, sp)
	cp	a, #0xf9
	jrnc	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 159: m++;
	addw	y, #0x0001
	ld	a, (0x0b, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x0a, sp)
	adc	a, #0x00
	ld	xh, a
	ldw	(0x0a, sp), x
00102$:
	rim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 164: m *= T4PERIOD;
	pushw	y
	ldw	x, (0x0c, sp)
	pushw	x
	push	#0xfa
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x08, sp), x
	ldw	(0x06, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 165: m += t;
	ld	a, (0x01, sp)
	clr	(0x04, sp)
	clrw	x
	ld	yl, a
	ld	a, (0x04, sp)
	ld	yh, a
	addw	y, (0x08, sp)
	ld	a, xl
	adc	a, (0x07, sp)
	rlwa	x
	adc	a, (0x06, sp)
	ld	xh, a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 167: m *= ((T4PRESCALER_FACTOR*1000000L)/(F_CPU));
	exgw	x, y
	ld	a, #0x02
00116$:
	sllw	x
	rlcw	y
	dec	a
	jrne	00116$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 168: return m;
	addw	sp, #13
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 184: void delay(unsigned long ms)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #12
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 188: start = (uint16_t) micros();	// use the lower 16 bits
	call	_micros
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 190: while (ms > 0) {
00105$:
	ldw	y, (0x11, sp)
	jrne	00130$
	ldw	y, (0x0f, sp)
	jreq	00108$
00130$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 192: now = (uint16_t) micros();	// use the lower 16 bits
	pushw	x
	call	_micros
	ldw	(0x07, sp), x
	popw	x
	ldw	y, (0x05, sp)
	ldw	(0x01, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 193: while ( (ms > 0) && ((uint16_t)(now-start) >= 1000) ) {
	ldw	y, (0x11, sp)
	ldw	(0x0b, sp), y
	ldw	y, (0x0f, sp)
	ldw	(0x09, sp), y
	ldw	(0x07, sp), x
00102$:
	ldw	y, (0x0b, sp)
	jrne	00131$
	ldw	y, (0x09, sp)
	jreq	00105$
00131$:
	ldw	y, (0x01, sp)
	subw	y, (0x07, sp)
	cpw	y, #0x03e8
	jrc	00105$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 194: ms--;
	ldw	x, (0x0b, sp)
	subw	x, #0x0001
	ldw	(0x0b, sp), x
	ld	a, (0x0a, sp)
	sbc	a, #0x00
	ld	(0x0a, sp), a
	ld	a, (0x09, sp)
	sbc	a, #0x00
	ld	(0x09, sp), a
	ldw	y, (0x0b, sp)
	ldw	(0x11, sp), y
	ldw	y, (0x09, sp)
	ldw	(0x0f, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 195: start += 1000;
	ldw	x, (0x07, sp)
	addw	x, #0x03e8
	ldw	(0x07, sp), x
	jra	00102$
00108$:
	addw	sp, #12
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 206: void delayMicroseconds(unsigned int us)
;	-----------------------------------------
;	 function delayMicroseconds
;	-----------------------------------------
_delayMicroseconds:
	sub	sp, #16
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 208: uint32_t start = micros();
	call	_micros
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 211: while (micros() - start < us)
00101$:
	call	_micros
	exg	a, yl
	ld	(0x06, sp), a
	exg	a, yl
	subw	x, (0x03, sp)
	ld	a, (0x06, sp)
	sbc	a, (0x02, sp)
	push	a
	ld	a, yh
	sbc	a, (0x02, sp)
	ld	(0x0e, sp), a
	pop	a
	ldw	y, (0x13, sp)
	ldw	(0x0b, sp), y
	clr	(0x0a, sp)
	clr	(0x09, sp)
	push	a
	cpw	x, (0x0c, sp)
	pop	a
	sbc	a, (0x0a, sp)
	ld	a, (0x0d, sp)
	sbc	a, (0x09, sp)
	jrnc	00104$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 212: nop();
	nop
	jra	00101$
00104$:
	addw	sp, #16
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 447: void init()
;	-----------------------------------------
;	 function init
;	-----------------------------------------
_init:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 451: CFG->GCR = CFG_GCR_SWD;
	mov	0x7f60+0, #0x01
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 458: CLK->CKDIVR = 0;
	mov	0x50c6+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 461: GPIO_DeInit(GPIOA);
	push	#0x00
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 462: GPIO_DeInit(GPIOB);
	push	#0x05
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 463: GPIO_DeInit(GPIOC);
	push	#0x0a
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 464: GPIO_DeInit(GPIOD);
	push	#0x0f
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 465: GPIO_DeInit(GPIOE);	// not present on STM8S103
	push	#0x14
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 466: GPIO_DeInit(GPIOF);	// not present on STM8S103
	push	#0x19
	push	#0x50
	call	_GPIO_DeInit
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 478: UART1_DeInit();
	call	_UART1_DeInit
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 484: TIM4_DeInit();
	call	_TIM4_DeInit
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 496: TIM4->PSCR = (uint8_t)(T4PRESCALER);
	mov	0x5347+0, #0x06
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 498: TIM4->ARR = (uint8_t)(T4PERIOD-1);
	mov	0x5348+0, #0xf9
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 500: TIM4->SR1 = (uint8_t)(~TIM4_FLAG_UPDATE);
	mov	0x5344+0, #0xfe
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 502: TIM4->IER |= TIM4_IT_UPDATE;
	bset	0x5343, #0
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 504: TIM4->CR1 |= TIM4_CR1_CEN;
	ldw	x, #0x5340
	ld	a, (x)
	or	a, #0x01
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 513: TIM1_DeInit();	// keep this
	call	_TIM1_DeInit
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 515: TIM1_TimeBaseInit(63, TIM1_COUNTERMODE_UP, 255, 0);	// keep this
	push	#0x00
	push	#0xff
	push	#0x00
	push	#0x00
	push	#0x3f
	push	#0x00
	call	_TIM1_TimeBaseInit
	addw	sp, #6
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 559: TIM1->CCER1 = 0;	// channel 1 and 2 disabled
	mov	0x525c+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 560: TIM1->CCER2 = 0;	// channel 3 and 4 disabled
	mov	0x525d+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 562: TIM1->CCMR1 = TIM1_OCMODE_PWM2 | TIM1_CCMR_OCxPE;
	mov	0x5258+0, #0x78
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 563: TIM1->CCMR2 = TIM1_OCMODE_PWM2 | TIM1_CCMR_OCxPE;
	mov	0x5259+0, #0x78
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 564: TIM1->CCMR3 = TIM1_OCMODE_PWM2 | TIM1_CCMR_OCxPE;
	mov	0x525a+0, #0x78
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 565: TIM1->CCMR4 = TIM1_OCMODE_PWM2 | TIM1_CCMR_OCxPE;
	mov	0x525b+0, #0x78
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 576: TIM1->CR1 = TIM1_CR1_CEN;	// TIM1_Cmd(ENABLE);
	mov	0x5250+0, #0x01
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 577: TIM1->BKR = TIM1_BKR_MOE;	// TIM1_CtrlPWMOutputs(ENABLE);
	mov	0x526d+0, #0x80
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 581: TIM2_DeInit();
	call	_TIM2_DeInit
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 582: TIM2_TimeBaseInit(TIM2_PRESCALER_64, 255);
	push	#0xff
	push	#0x00
	push	#0x06
	call	_TIM2_TimeBaseInit
	addw	sp, #3
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 610: TIM2->CCER1 = 0;	// channel 1 and 2 disabled
	mov	0x530a+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 611: TIM2->CCER2 = 0;	// channel 3 and 4 disabled
	mov	0x530b+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 613: TIM2->CCMR1 = TIM2_OCMODE_PWM1 | TIM2_CCMR_OCxPE;
	mov	0x5307+0, #0x68
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 614: TIM2->CCMR2 = TIM2_OCMODE_PWM1 | TIM2_CCMR_OCxPE;
	mov	0x5308+0, #0x68
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 615: TIM2->CCMR3 = TIM2_OCMODE_PWM1 | TIM2_CCMR_OCxPE;
	mov	0x5309+0, #0x68
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 617: TIM2->CR1 = TIM2_CR1_CEN;	// TIM1_Cmd(ENABLE);
	mov	0x5300+0, #0x01
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 659: ADC1_DeInit();
	call	_ADC1_DeInit
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 665: ADC1->CR1 = 6 <<4;
	mov	0x5401+0, #0x60
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 712: enableInterrupts();
	rim
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 742: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 744: init();
	call	_init
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 746: initVariant();
	call	_initVariant
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 748: setup();
	call	_setup
00104$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 751: loop();
	call	_loop
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\wiring.c: 752: if (runSerialEvent) serialEvent();
	tnz	_runSerialEvent+0
	jreq	00104$
	call	_serialEvent
	jra	00104$
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
