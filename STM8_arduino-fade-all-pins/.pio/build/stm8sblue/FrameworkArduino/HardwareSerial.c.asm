;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module HardwareSerial
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _HardwareSerial_peek
	.globl _UART1_DeInit
	.globl _CLK_GetClockFreq
	.globl _UART1_RX_IRQHandler
	.globl _UART1_TX_IRQHandler
	.globl _HardwareSerial
	.globl _HardwareSerial_begin
	.globl _HardwareSerial_begin_config
	.globl _HardwareSerial_end
	.globl _HardwareSerial_available
	.globl _HardwareSerial_read
	.globl _HardwareSerial_flush
	.globl _HardwareSerial_write
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_rx_buffer:
	.ds 20
_tx_buffer:
	.ds 20
_transmitting:
	.ds 1
_initialized:
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 139: static void store_char(unsigned char c, ring_buffer *buffer)
;	-----------------------------------------
;	 function store_char
;	-----------------------------------------
_store_char:
	sub	sp, #8
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 142: int i = (unsigned int)(buffer->head + 1) % SERIAL_BUFFER_SIZE;
	ldw	y, (0x0c, sp)
	ldw	(0x03, sp), y
	ldw	x, y
	addw	x, #0x0010
	ldw	(0x07, sp), x
	ldw	x, (x)
	incw	x
	ld	a, xl
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 148: if (i != buffer->tail) {
	ldw	x, (0x03, sp)
	ldw	x, (0x12, x)
	ldw	(0x05, sp), x
	ldw	x, (0x01, sp)
	cpw	x, (0x05, sp)
	jreq	00103$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 149: buffer->buffer[buffer->head] = c;
	ldw	x, (0x07, sp)
	ldw	x, (x)
	addw	x, (0x03, sp)
	ld	a, (0x0b, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 150: buffer->head = i;
	ldw	x, (0x07, sp)
	ldw	y, (0x01, sp)
	ldw	(x), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 151: runSerialEvent = 1;
	mov	_runSerialEvent+0, #0x01
00103$:
	addw	sp, #8
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 157: void UARTx_RX_IRQHandler(void) __interrupt(ITC_IRQ_UARTx_RX) /* UART1/2 RX */
;	-----------------------------------------
;	 function UART1_RX_IRQHandler
;	-----------------------------------------
_UART1_RX_IRQHandler:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 166: c = UARTx->DR;
	ldw	x, #0x5231
	ld	a, (x)
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 168: if (!(UARTx->SR & UARTx_FLAG_PE)) {
	ldw	x, #0x5230
	push	a
	ld	a, (x)
	ld	xl, a
	pop	a
	clr	(0x01, sp)
	srlw	x
	jrc	00103$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 171: store_char(c, &rx_buffer);
	ldw	x, #_rx_buffer+0
	pushw	x
	push	a
	call	_store_char
	addw	sp, #3
00103$:
	addw	sp, #2
	iret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 176: void UARTx_TX_IRQHandler(void) __interrupt(ITC_IRQ_UARTx_TX) /* UART1/2 TX */
;	-----------------------------------------
;	 function UART1_TX_IRQHandler
;	-----------------------------------------
_UART1_TX_IRQHandler:
	sub	sp, #6
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 192: if (tx_buffer.head == tx_buffer.tail) {
	ldw	x, #_tx_buffer+0
	ldw	(0x01, sp), x
	ldw	y, x
	ldw	y, (0x10, y)
	ldw	x, (0x01, sp)
	addw	x, #0x0012
	ldw	(0x05, sp), x
	ldw	x, (x)
	ldw	(0x03, sp), x
	ldw	x, y
	cpw	x, (0x03, sp)
	jrne	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 194: transmitting = 0;
	clr	_transmitting+0
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 195: UARTx->CR2 &= ~UARTx_CR2_TIEN;
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0x7f
	ld	(x), a
	jra	00104$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 199: unsigned char c = tx_buffer.buffer[tx_buffer.tail];
	ldw	x, (0x05, sp)
	ldw	x, (x)
	addw	x, (0x01, sp)
	ld	a, (x)
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 200: tx_buffer.tail = (tx_buffer.tail + 1) % SERIAL_BUFFER_SIZE;
	ldw	x, (0x05, sp)
	ldw	x, (x)
	incw	x
	push	a
	ld	a, xl
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
	pop	a
	ldw	y, (0x05, sp)
	ldw	(y), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 202: UARTx->DR = c;
	ldw	x, #0x5231
	ld	(x), a
00104$:
	addw	sp, #6
	iret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 209: uint8_t HardwareSerial(void)
;	-----------------------------------------
;	 function HardwareSerial
;	-----------------------------------------
_HardwareSerial:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 211: return initialized;
	ld	a, _initialized+0
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 215: void HardwareSerial_begin(unsigned long baud)
;	-----------------------------------------
;	 function HardwareSerial_begin
;	-----------------------------------------
_HardwareSerial_begin:
	sub	sp, #5
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 228: divider = (uint16_t) ((uint32_t)CLK_GetClockFreq() / (uint32_t) baud);
	call	_CLK_GetClockFreq
	ldw	(0x04, sp), x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 230: UARTx->BRR2 = divider & 0x0f;
	ld	a, xl
	and	a, #0x0f
	ldw	y, #0x5233
	ld	(y), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 231: divider >>= 4;
	ld	a, #0x10
	div	x, a
	ld	a, xl
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 232: UARTx->BRR1 = divider & 0xff;
	ldw	x, #0x5232
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 234: UARTx->BRR2 |= (uint8_t) divider & 0xf0;
	ldw	x, #0x5233
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
	and	a, #0xf0
	or	a, (0x01, sp)
	ldw	x, #0x5233
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 236: UARTx->CR1 = 0;			// 8 Bit, no parity
	mov	0x5234+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 237: UARTx->CR3 = 0;			// one stop bit
	mov	0x5236+0, #0x00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 239: UARTx->CR2 = UARTx_CR2_RIEN | UARTx_CR2_TEN | UARTx_CR2_REN;
	mov	0x5235+0, #0x2c
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 241: initialized = 1;
	mov	_initialized+0, #0x01
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 242: runSerialEvent = 0;
	clr	_runSerialEvent+0
	addw	sp, #5
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 246: void HardwareSerial_begin_config(unsigned long baud, uint8_t config)
;	-----------------------------------------
;	 function HardwareSerial_begin_config
;	-----------------------------------------
_HardwareSerial_begin_config:
	sub	sp, #5
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 269: divider = (uint16_t) ((uint32_t)CLK_GetClockFreq() / (uint32_t) baud);
	call	_CLK_GetClockFreq
	ldw	(0x03, sp), x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 271: UARTx->BRR2 = divider & 0x0f;
	ld	a, xl
	and	a, #0x0f
	ldw	y, #0x5233
	ld	(y), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 272: divider >>= 4;
	ld	a, #0x10
	div	x, a
	ld	a, xl
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 273: UARTx->BRR1 = divider & 0xff;
	ldw	x, #0x5232
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 275: UARTx->BRR2 |= (uint8_t) divider & 0xf0;
	ldw	x, #0x5233
	push	a
	ld	a, (x)
	ld	(0x06, sp), a
	pop	a
	and	a, #0xf0
	or	a, (0x05, sp)
	ldw	x, #0x5233
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 277: UARTx->CR1 = config & (MASK_DATABITS | MASK_PARITY);
	ld	a, (0x0c, sp)
	and	a, #0x16
	ldw	x, #0x5234
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 278: UARTx->CR3 = config & (MASK_STOPBITS);
	ld	a, (0x0c, sp)
	and	a, #0x20
	ldw	x, #0x5236
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 280: UARTx->CR2 = UARTx_CR2_RIEN | UARTx_CR2_TEN | UARTx_CR2_REN;
	mov	0x5235+0, #0x2c
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 282: initialized = 1;
	mov	_initialized+0, #0x01
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 283: runSerialEvent = 0;
	clr	_runSerialEvent+0
	addw	sp, #5
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 287: void HardwareSerial_end(void)
;	-----------------------------------------
;	 function HardwareSerial_end
;	-----------------------------------------
_HardwareSerial_end:
	sub	sp, #8
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 290: while (tx_buffer.head != tx_buffer.tail)
	ldw	x, #_tx_buffer+0
	ldw	(0x05, sp), x
	ldw	(0x01, sp), x
00101$:
	ldw	x, (0x05, sp)
	ldw	x, (0x10, x)
	ldw	y, (0x01, sp)
	ldw	y, (0x12, y)
	ldw	(0x03, sp), y
	cpw	x, (0x03, sp)
	jrne	00101$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 293: UARTx_DeInit();
	call	_UART1_DeInit
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 296: rx_buffer.head = rx_buffer.tail;
	ldw	x, #_rx_buffer+0
	ldw	(0x07, sp), x
	addw	x, #0x0010
	ldw	y, (0x07, sp)
	ldw	y, (0x12, y)
	ldw	(x), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 297: initialized = 0;
	clr	_initialized+0
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 298: runSerialEvent = 0;
	clr	_runSerialEvent+0
	addw	sp, #8
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 301: int HardwareSerial_available(void)
;	-----------------------------------------
;	 function HardwareSerial_available
;	-----------------------------------------
_HardwareSerial_available:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 303: return (unsigned int)(SERIAL_BUFFER_SIZE + rx_buffer.head - rx_buffer.tail) % SERIAL_BUFFER_SIZE;
	ldw	y, #_rx_buffer+0
	ldw	x, y
	ld	a, yl
	ld	xl, a
	ldw	x, (0x10, x)
	addw	x, #0x0010
	ldw	y, (0x12, y)
	ldw	(0x01, sp), y
	subw	x, (0x01, sp)
	ld	a, xl
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 306: int HardwareSerial_peek(void)
;	-----------------------------------------
;	 function HardwareSerial_peek
;	-----------------------------------------
_HardwareSerial_peek:
	sub	sp, #4
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 308: if (rx_buffer.head == rx_buffer.tail) {
	ldw	x, #_rx_buffer+0
	ldw	(0x03, sp), x
	ldw	y, x
	ldw	y, (0x10, y)
	ldw	x, (0x03, sp)
	addw	x, #0x0012
	ld	a, (0x1, x)
	ld	(0x02, sp), a
	ld	a, (x)
	ld	(0x01, sp), a
	exgw	x, y
	cpw	x, (0x01, sp)
	exgw	x, y
	jrne	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 310: return -1;
	ldw	x, #0xffff
	jra	00104$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 312: return rx_buffer.buffer[rx_buffer.tail];
	ldw	x, (x)
	addw	x, (0x03, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
00104$:
	addw	sp, #4
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 316: int HardwareSerial_read(void)
;	-----------------------------------------
;	 function HardwareSerial_read
;	-----------------------------------------
_HardwareSerial_read:
	sub	sp, #11
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 319: if (rx_buffer.head == rx_buffer.tail) {
	ldw	x, #_rx_buffer+0
	ldw	(0x08, sp), x
	addw	x, #0x0010
	ldw	(0x06, sp), x
	ldw	x, (x)
	ldw	y, (0x08, sp)
	addw	y, #0x0012
	ldw	(0x02, sp), y
	ldw	y, (y)
	ldw	(0x0a, sp), y
	cpw	x, (0x0a, sp)
	jrne	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 321: return -1;
	ldw	x, #0xffff
	jra	00104$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 323: unsigned char c = rx_buffer.buffer[rx_buffer.tail];
	ldw	x, (0x02, sp)
	ldw	x, (x)
	addw	x, (0x08, sp)
	ld	a, (x)
	ld	(0x01, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 324: rx_buffer.tail = (unsigned int)(rx_buffer.tail + 1) % SERIAL_BUFFER_SIZE;
	ldw	x, (0x02, sp)
	ldw	x, (x)
	incw	x
	ld	a, xl
	and	a, #0x0f
	ld	(0x05, sp), a
	clr	(0x04, sp)
	ldw	x, (0x02, sp)
	ldw	y, (0x04, sp)
	ldw	(x), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 325: runSerialEvent = (rx_buffer.head != rx_buffer.tail);
	ldw	x, (0x06, sp)
	ldw	x, (x)
	ldw	y, (0x02, sp)
	ldw	y, (y)
	ld	a, yh
	cpw	x, (0x04, sp)
	jrne	00114$
	ld	a, #0x01
	.byte 0x21
00114$:
	clr	a
00115$:
	sub	a, #0x01
	clr	a
	rlc	a
	ld	_runSerialEvent+0, a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 326: return c;
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
00104$:
	addw	sp, #11
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 330: void HardwareSerial_flush(void)
;	-----------------------------------------
;	 function HardwareSerial_flush
;	-----------------------------------------
_HardwareSerial_flush:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 340: while (transmitting && !(UARTx->SR & UARTx_FLAG_TC));
00102$:
	tnz	_transmitting+0
	jreq	00104$
	ldw	x, #0x5230
	ld	a, (x)
	clr	(0x01, sp)
	bcp	a, #0x40
	jreq	00102$
00104$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 342: transmitting = 0;
	clr	_transmitting+0
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 345: size_t HardwareSerial_write(uint8_t c)
;	-----------------------------------------
;	 function HardwareSerial_write
;	-----------------------------------------
_HardwareSerial_write:
	sub	sp, #10
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 347: int i = (tx_buffer.head + 1) % SERIAL_BUFFER_SIZE;
	ldw	x, #_tx_buffer+0
	ldw	(0x03, sp), x
	addw	x, #0x0010
	ldw	(0x09, sp), x
	ldw	x, (x)
	incw	x
	ld	a, xl
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 352: while (i == tx_buffer.tail)
	ldw	y, (0x03, sp)
	ldw	(0x05, sp), y
00101$:
	ldw	x, (0x05, sp)
	ldw	x, (0x12, x)
	ldw	(0x07, sp), x
	ldw	x, (0x01, sp)
	cpw	x, (0x07, sp)
	jreq	00101$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 355: tx_buffer.buffer[tx_buffer.head] = c;
	ldw	x, (0x09, sp)
	ldw	x, (x)
	addw	x, (0x03, sp)
	ld	a, (0x0d, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 356: tx_buffer.head = i;
	ldw	x, (0x09, sp)
	ldw	y, (0x01, sp)
	ldw	(x), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 361: UARTx->CR2 |= UARTx_CR2_TIEN;			// enable TXE interrupt
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x80
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 363: transmitting = 1;
	mov	_transmitting+0, #0x01
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\HardwareSerial.c: 369: return 1;
	ldw	x, #0x0001
	addw	sp, #10
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
