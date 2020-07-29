;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module Print_float
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Print_println
	.globl _Print_print_ub
	.globl _Print_print_s
	.globl _isinf
	.globl _isnan
	.globl _Print_print_fd
	.globl _Print_println_fd
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 51: size_t Print_print_fd(writefunc_p writefunc, double number, uint8_t digits)
;	-----------------------------------------
;	 function Print_print_fd
;	-----------------------------------------
_Print_print_fd:
	sub	sp, #27
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 53: size_t n = 0;
	clrw	x
	ldw	(0x13, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 59: if (isnan(number)) return printStr(writefunc,"nan");
	ldw	x, (0x22, sp)
	pushw	x
	ldw	x, (0x22, sp)
	pushw	x
	call	_isnan
	addw	sp, #4
	ldw	(0x11, sp), x
	jreq	00102$
	ldw	x, #___str_0+0
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	call	_Print_print_s
	addw	sp, #4
	jp	00120$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 60: if (isinf(number)) return printStr(writefunc,"inf");
	ldw	x, (0x22, sp)
	pushw	x
	ldw	x, (0x22, sp)
	pushw	x
	call	_isinf
	addw	sp, #4
	tnzw	x
	jreq	00104$
	ldw	x, #___str_1+0
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	call	_Print_print_s
	addw	sp, #4
	jp	00120$
00104$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 61: if (number > 4294967040.0) return printStr (writefunc,"ovf");  // constant determined empirically
	push	#0xff
	push	#0xff
	push	#0x7f
	push	#0x4f
	ldw	x, (0x26, sp)
	pushw	x
	ldw	x, (0x26, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00106$
	ldw	x, #___str_2+0
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	call	_Print_print_s
	addw	sp, #4
	jp	00120$
00106$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 62: if (number <-4294967040.0) return printStr (writefunc,"ovf");  // constant determined empirically
	push	#0xff
	push	#0xff
	push	#0x7f
	push	#0xcf
	ldw	x, (0x26, sp)
	pushw	x
	ldw	x, (0x26, sp)
	pushw	x
	call	___fslt
	addw	sp, #8
	tnz	a
	jreq	00108$
	ldw	x, #___str_2+0
	pushw	x
	ldw	x, (0x20, sp)
	pushw	x
	call	_Print_print_s
	addw	sp, #4
	jp	00120$
00108$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 65: if (number < 0.0)
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, (0x26, sp)
	pushw	x
	ldw	x, (0x26, sp)
	pushw	x
	call	___fslt
	addw	sp, #8
	ld	(0x1a, sp), a
	tnz	(0x1a, sp)
	jreq	00110$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 67: n += writefunc('-');
	push	#0x2d
	ldw	x, (0x1f, sp)
	call	(x)
	pop	a
	ldw	(0x13, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 68: number = -number;
	ldw	y, (0x22, sp)
	ldw	x, (0x20, sp)
	sllw	x
	ccf
	rrcw	x
	ldw	(0x22, sp), y
	ldw	(0x20, sp), x
00110$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 72: rounding = 0.5;
	clrw	x
	ldw	(0x0f, sp), x
	ldw	y, #0x3f00
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 73: for (i=0; i<digits; ++i)
	clr	a
00118$:
	cp	a, (0x24, sp)
	jrnc	00111$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 74: rounding /= 10.0;
	push	a
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	ldw	x, (0x14, sp)
	pushw	x
	pushw	y
	call	___fsdiv
	addw	sp, #8
	pop	a
	ldw	(0x0f, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 73: for (i=0; i<digits; ++i)
	inc	a
	jra	00118$
00111$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 76: number += rounding;
	ldw	x, (0x0f, sp)
	pushw	x
	pushw	y
	ldw	x, (0x26, sp)
	pushw	x
	ldw	x, (0x26, sp)
	pushw	x
	call	___fsadd
	addw	sp, #8
	ldw	(0x22, sp), x
	ldw	(0x20, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 79: int_part = (unsigned long)number;
	ldw	x, (0x22, sp)
	pushw	x
	ldw	x, (0x22, sp)
	pushw	x
	call	___fs2ulong
	addw	sp, #4
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 80: remainder = number - (double)int_part;
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	call	___ulong2fs
	addw	sp, #4
	pushw	x
	pushw	y
	ldw	x, (0x26, sp)
	pushw	x
	ldw	x, (0x26, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x17, sp), x
	ldw	(0x15, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 81: n += printNumber(writefunc,int_part,10);
	push	#0x0a
	ldw	x, (0x04, sp)
	pushw	x
	ldw	x, (0x04, sp)
	pushw	x
	ldw	x, (0x23, sp)
	pushw	x
	call	_Print_print_ub
	addw	sp, #7
	addw	x, (0x13, sp)
	ldw	(0x09, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 84: if (digits > 0) {
	tnz	(0x24, sp)
	jreq	00131$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 85: n += writefunc('.'); 
	push	#0x2e
	ldw	x, (0x1f, sp)
	call	(x)
	pop	a
	addw	x, (0x09, sp)
	ldw	(0x09, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 89: while (digits-- > 0)
00131$:
	ld	a, (0x24, sp)
	ld	(0x19, sp), a
00114$:
	ld	a, (0x19, sp)
	ld	(0x1b, sp), a
	dec	(0x19, sp)
	tnz	(0x1b, sp)
	jreq	00116$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 91: remainder *= 10.0;
	ldw	x, (0x17, sp)
	pushw	x
	ldw	x, (0x17, sp)
	pushw	x
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	call	___fsmul
	addw	sp, #8
	ldw	(0x07, sp), x
	ldw	(0x05, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 92: toPrint = (unsigned int)(remainder);
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	___fs2uint
	addw	sp, #4
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 93: n += printNumber(writefunc,toPrint,10);
	ldw	(0x0b, sp), x
	ldw	y, x
	clrw	x
	push	#0x0a
	pushw	y
	pushw	x
	ldw	x, (0x23, sp)
	pushw	x
	call	_Print_print_ub
	addw	sp, #7
	addw	x, (0x09, sp)
	ldw	(0x09, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 94: remainder -= toPrint; 
	ldw	x, (0x0b, sp)
	pushw	x
	call	___uint2fs
	addw	sp, #2
	pushw	x
	pushw	y
	ldw	x, (0x0b, sp)
	pushw	x
	ldw	x, (0x0b, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x17, sp), x
	ldw	(0x15, sp), y
	jra	00114$
00116$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 97: return n;
	ldw	x, (0x09, sp)
00120$:
	addw	sp, #27
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 101: size_t Print_println_fd(writefunc_p writefunc, double number, uint8_t digits)
;	-----------------------------------------
;	 function Print_println_fd
;	-----------------------------------------
_Print_println_fd:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 105: r = Print_print_fd(writefunc, number, digits);
	ld	a, (0x0b, sp)
	push	a
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	call	_Print_print_fd
	addw	sp, #7
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print-float.c: 106: return r + Print_println(writefunc);
	ldw	x, (0x05, sp)
	pushw	x
	call	_Print_println
	addw	sp, #2
	addw	x, (0x01, sp)
	addw	sp, #2
	ret
	.area CODE
___str_0:
	.ascii "nan"
	.db 0x00
___str_1:
	.ascii "inf"
	.db 0x00
___str_2:
	.ascii "ovf"
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
