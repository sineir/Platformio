;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module SPI
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _digitalWrite
	.globl _pinMode
	.globl _SPI_begin
	.globl _SPI_transfer_asm
	.globl _SPI_end
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_SPI_initialized:
	.ds 1
_SPI_interruptMode:
	.ds 1
_SPI_interruptMask:
	.ds 1
_SPI_interruptSave:
	.ds 1
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 27: void SPI_begin(void)
;	-----------------------------------------
;	 function SPI_begin
;	-----------------------------------------
_SPI_begin:
	sub	sp, #6
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 70: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 34: if (!SPI_initialized) {
	tnz	_SPI_initialized+0
	jrne	00104$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 36: port = digitalPinToPort(SS);
	ldw	x, #_digital_pin_to_port_PGM+2
	ld	a, (x)
	ld	(0x04, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 37: bit = digitalPinToBitMask(SS);
	ldw	x, #_digital_pin_to_bit_mask_PGM+2
	ld	a, (x)
	ld	(0x03, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 38: reg = portModeRegister(port);
	ldw	x, #_port_to_mode_PGM+0
	ldw	(0x05, sp), x
	clrw	x
	ld	a, (0x04, sp)
	ld	xl, a
	sllw	x
	addw	x, (0x05, sp)
	ldw	x, (x)
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 42: if(!(*reg & bit)){
	ld	a, (x)
	and	a, (0x03, sp)
	tnz	a
	jrne	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 43: digitalWrite(SS, HIGH);
	push	#0x01
	push	#0x02
	call	_digitalWrite
	addw	sp, #2
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 49: pinMode(SS, OUTPUT);
	push	#0x01
	push	#0x02
	call	_pinMode
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 53: SPI->CR2 = SPI_CR2_SSI | SPI_CR2_SSM;
	mov	0x5201+0, #0x03
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 58: SPI->CR1 |= SPI_CR1_MSTR | SPI_CR1_SPE;
	ldw	x, #0x5200
	ld	a, (x)
	or	a, #0x44
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 66: pinMode(SCK, OUTPUT);
	push	#0x01
	push	#0x07
	call	_pinMode
	addw	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 67: pinMode(MOSI, OUTPUT);
	push	#0x01
	push	#0x08
	call	_pinMode
	addw	sp, #2
00104$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 69: SPI_initialized++; // reference count
	ld	a, _SPI_initialized+0
	inc	a
	ld	_SPI_initialized+0, a
	rim
	addw	sp, #6
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 148: void SPI_transfer_asm(void *buf, size_t count) {
;	-----------------------------------------
;	 function SPI_transfer_asm
;	-----------------------------------------
_SPI_transfer_asm:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 177: __endasm;
	ldw	y,(5,SP)
	jreq	$00001
	ldw	x,(3,SP)
	ld	a,(x) ; ((SPI_TypeDef *) 0x5200)->DR = *p
	ld	0x5204,a
	jra	$00003 ; start the while loop
	$00002:
	ld	a,(1,x) ; out = *(p+1)
	btjf	0x5203,#1,. ; while (!(((SPI_TypeDef *) 0x5200)->SR & ((uint8_t)0x02)));
	sim	; make sure to avoid a possible
;	race condition to not miss the
;	received data
	ld	0x5204,a ; ((SPI_TypeDef *) 0x5200)->DR = out
	btjf	0x5203,#0,. ; while (!(((SPI_TypeDef *) 0x5200)->SR & ((uint8_t)0x01)));
	ld	a,0x5204 ; in = ((SPI_TypeDef *) 0x5200)->DR
	rim
	ld	(x),a ; *p++ = in
	incw	x
	$00003:
	decw	y
	jrne	$00002 ; }
	btjf	0x5203,#0,. ; while (!(((SPI_TypeDef *) 0x5200)->SR & ((uint8_t)0x01)));
	ld	a,0x5204 ; *p = ((SPI_TypeDef *) 0x5200)->DR
	ld	(x),a
	$00001:
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 210: void SPI_end(void) {
;	-----------------------------------------
;	 function SPI_end
;	-----------------------------------------
_SPI_end:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 231: END_CRITICAL
	sim
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 213: if (SPI_initialized)
	tnz	_SPI_initialized+0
	jreq	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 214: SPI_initialized--;
	dec	_SPI_initialized+0
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 216: if (!SPI_initialized) {
	tnz	_SPI_initialized+0
	jrne	00110$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 221: while ((SPI->SR&SPI_SR_TXE)==0);
00103$:
	ldw	x, #0x5203
	ld	a, (x)
	bcp	a, #0x02
	jreq	00103$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 223: while (SPI->SR&SPI_SR_BSY);
00106$:
	ldw	x, #0x5203
	ld	a, (x)
	tnz	a
	jrmi	00106$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 225: SPI->CR1 &= ~SPI_CR1_SPE;
	ldw	x, #0x5200
	ld	a, (x)
	and	a, #0xbf
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\SPI.c: 226: SPI_interruptMode = 0;
	clr	_SPI_interruptMode+0
00110$:
	rim
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
