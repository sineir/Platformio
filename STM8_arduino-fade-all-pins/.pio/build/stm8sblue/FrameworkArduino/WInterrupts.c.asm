;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module WInterrupts
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _attachInterrupt
	.globl _detachInterrupt
	.globl _EXTI_PORTA_IRQHandler
	.globl _EXTI_PORTB_IRQHandler
	.globl _EXTI_PORTC_IRQHandler
	.globl _EXTI_PORTD_IRQHandler
	.globl _EXTI_PORTE_IRQHandler
	.globl _TIM1_CAP_COM_IRQHandler
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_intFunc:
	.ds 18
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 33: static void nothing(void) {
;	-----------------------------------------
;	 function nothing
;	-----------------------------------------
_nothing:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 34: }
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 71: void attachInterrupt(uint8_t interruptNum, void (*userFunc)(void), int mode) {
;	-----------------------------------------
;	 function attachInterrupt
;	-----------------------------------------
_attachInterrupt:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 72: if(interruptNum < EXTERNAL_NUM_INTERRUPTS) {
	ld	a, (0x05, sp)
	cp	a, #0x09
	jrnc	00103$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 73: intFunc[interruptNum] = userFunc;
	ldw	x, #_intFunc+0
	ldw	(0x01, sp), x
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	sllw	x
	addw	x, (0x01, sp)
	ldw	y, (0x06, sp)
	ldw	(x), y
00103$:
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 189: void detachInterrupt(uint8_t interruptNum) {
;	-----------------------------------------
;	 function detachInterrupt
;	-----------------------------------------
_detachInterrupt:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 190: if(interruptNum < EXTERNAL_NUM_INTERRUPTS) {
	ld	a, (0x05, sp)
	cp	a, #0x09
	jrnc	00103$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 277: intFunc[interruptNum] = nothing;
	ldw	x, #_intFunc+0
	ldw	(0x01, sp), x
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	sllw	x
	addw	x, (0x01, sp)
	ldw	y, #_nothing
	ldw	(x), y
00103$:
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 303: IMPLEMENT_ISR(EXTI_PORTA_IRQHandler,		INT_PORTA) /* EXTI PORTA */
;	-----------------------------------------
;	 function EXTI_PORTA_IRQHandler
;	-----------------------------------------
_EXTI_PORTA_IRQHandler:
;	naked function: no prologue.
	ldw	x, #_intFunc+0
	ldw	x, (x)
	call	(x)
	iret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 304: IMPLEMENT_ISR(EXTI_PORTB_IRQHandler,		INT_PORTB) /* EXTI PORTB */
;	-----------------------------------------
;	 function EXTI_PORTB_IRQHandler
;	-----------------------------------------
_EXTI_PORTB_IRQHandler:
;	naked function: no prologue.
	ldw	x, #_intFunc+2
	ldw	x, (x)
	call	(x)
	iret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 305: IMPLEMENT_ISR(EXTI_PORTC_IRQHandler,		INT_PORTC) /* EXTI PORTC */
;	-----------------------------------------
;	 function EXTI_PORTC_IRQHandler
;	-----------------------------------------
_EXTI_PORTC_IRQHandler:
;	naked function: no prologue.
	ldw	x, #_intFunc+4
	ldw	x, (x)
	call	(x)
	iret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 306: IMPLEMENT_ISR(EXTI_PORTD_IRQHandler,		INT_PORTD) /* EXTI PORTD */
;	-----------------------------------------
;	 function EXTI_PORTD_IRQHandler
;	-----------------------------------------
_EXTI_PORTD_IRQHandler:
;	naked function: no prologue.
	ldw	x, #_intFunc+6
	ldw	x, (x)
	call	(x)
	iret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 307: IMPLEMENT_ISR(EXTI_PORTE_IRQHandler,		INT_PORTE) /* EXTI PORTE */
;	-----------------------------------------
;	 function EXTI_PORTE_IRQHandler
;	-----------------------------------------
_EXTI_PORTE_IRQHandler:
;	naked function: no prologue.
	ldw	x, #_intFunc+8
	ldw	x, (x)
	call	(x)
	iret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\WInterrupts.c: 308: IMPLEMENT_ISR(TIM1_CAP_COM_IRQHandler,		INT_TIM1_CAPCOM)
;	-----------------------------------------
;	 function TIM1_CAP_COM_IRQHandler
;	-----------------------------------------
_TIM1_CAP_COM_IRQHandler:
;	naked function: no prologue.
	ldw	x, #_intFunc+10
	ldw	x, (x)
	call	(x)
	iret
	.area CODE
	.area INITIALIZER
__xinit__intFunc:
	.dw _nothing
	.dw _nothing
	.dw _nothing
	.dw _nothing
	.dw _nothing
	.dw _nothing
	.dw _nothing
	.dw _nothing
	.dw _nothing
	.area CABS (ABS)
