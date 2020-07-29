;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.3 #9771 (MINGW32)
;--------------------------------------------------------
	.module Print
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Print_print_sn
	.globl _Print_print_s
	.globl _Print_print_u
	.globl _Print_print_i
	.globl _Print_println_sn
	.globl _Print_println_s
	.globl _Print_println_u
	.globl _Print_println_i
	.globl _Print_println_ub
	.globl _Print_println_ib
	.globl _Print_println
	.globl _Print_print_ub
	.globl _Print_print_ib
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
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 52: size_t Print_print_sn(writefunc_p writefunc, const uint8_t *buffer, size_t size)
;	-----------------------------------------
;	 function Print_print_sn
;	-----------------------------------------
_Print_print_sn:
	sub	sp, #6
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 55: while (size--) {
	ldw	y, (0x0b, sp)
	ldw	(0x03, sp), y
	clrw	x
	ldw	(0x01, sp), x
	ldw	y, (0x0d, sp)
	ldw	(0x05, sp), y
00104$:
	ldw	x, (0x05, sp)
	ldw	y, (0x05, sp)
	decw	y
	ldw	(0x05, sp), y
	tnzw	x
	jreq	00106$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 56: if (writefunc(*buffer++)) n++;
	ldw	x, (0x03, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x03, sp), x
	push	a
	ldw	x, (0x0a, sp)
	call	(x)
	pop	a
	tnzw	x
	jreq	00106$
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	jra	00104$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 57: else break;
00106$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 59: return n;
	ldw	x, (0x01, sp)
	addw	sp, #6
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 62: size_t Print_print_s(writefunc_p writefunc, const char *str)
;	-----------------------------------------
;	 function Print_print_s
;	-----------------------------------------
_Print_print_s:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 67: if (!str) return 0;
	ldw	x, (0x07, sp)
	jrne	00114$
	clrw	x
	jra	00109$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 69: while ( c=*str++ ) {	// assignment intented
00114$:
	clrw	x
	ldw	(0x01, sp), x
	ldw	y, (0x07, sp)
00106$:
	ld	a, (y)
	incw	y
	ld	xl, a
	tnz	a
	jreq	00108$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 70: if (writefunc(c)) n++;
	pushw	y
	ld	a, xl
	push	a
	ldw	x, (0x08, sp)
	call	(x)
	pop	a
	popw	y
	tnzw	x
	jreq	00108$
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	jra	00106$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 71: else break;
00108$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 73: return n;
	ldw	x, (0x01, sp)
00109$:
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 77: size_t Print_print_u(writefunc_p writefunc, unsigned long n)
;	-----------------------------------------
;	 function Print_print_u
;	-----------------------------------------
_Print_print_u:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 79: return printNumber(writefunc, n,10);
	push	#0x0a
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	_Print_print_ub
	addw	sp, #7
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 82: size_t Print_print_i(writefunc_p writefunc, long n)
;	-----------------------------------------
;	 function Print_print_i
;	-----------------------------------------
_Print_print_i:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 84: return printInt(writefunc, n,10);
	push	#0x0a
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	ldw	x, (0x08, sp)
	pushw	x
	call	_Print_print_ib
	addw	sp, #7
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 89: size_t Print_println_sn(writefunc_p writefunc, const uint8_t *buffer, size_t size)
;	-----------------------------------------
;	 function Print_println_sn
;	-----------------------------------------
_Print_println_sn:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 93: r = Print_print_sn(writefunc, buffer, size);
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	ldw	x, (0x09, sp)
	pushw	x
	call	_Print_print_sn
	addw	sp, #6
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 94: return r + Print_println(writefunc);
	ldw	x, (0x05, sp)
	pushw	x
	call	_Print_println
	addw	sp, #2
	addw	x, (0x01, sp)
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 97: size_t Print_println_s(writefunc_p writefunc, const char *str)
;	-----------------------------------------
;	 function Print_println_s
;	-----------------------------------------
_Print_println_s:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 101: r = Print_print_s(writefunc, str);
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	_Print_print_s
	addw	sp, #4
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 102: return r + Print_println(writefunc);
	ldw	x, (0x05, sp)
	pushw	x
	call	_Print_println
	addw	sp, #2
	addw	x, (0x01, sp)
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 105: size_t Print_println_u(writefunc_p writefunc, unsigned long n)
;	-----------------------------------------
;	 function Print_println_u
;	-----------------------------------------
_Print_println_u:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 109: r = printNumber(writefunc, n,10);
	push	#0x0a
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	call	_Print_print_ub
	addw	sp, #7
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 110: return r + Print_println(writefunc);
	ldw	x, (0x05, sp)
	pushw	x
	call	_Print_println
	addw	sp, #2
	addw	x, (0x01, sp)
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 113: size_t Print_println_i(writefunc_p writefunc, long n)
;	-----------------------------------------
;	 function Print_println_i
;	-----------------------------------------
_Print_println_i:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 117: r = printInt(writefunc, n,10);
	push	#0x0a
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	call	_Print_print_ib
	addw	sp, #7
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 118: return r + Print_println(writefunc);
	ldw	x, (0x05, sp)
	pushw	x
	call	_Print_println
	addw	sp, #2
	addw	x, (0x01, sp)
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 121: size_t Print_println_ub(writefunc_p writefunc, unsigned long n, uint8_t base)
;	-----------------------------------------
;	 function Print_println_ub
;	-----------------------------------------
_Print_println_ub:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 125: r = printNumber(writefunc, n,base);
	ld	a, (0x0b, sp)
	push	a
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	call	_Print_print_ub
	addw	sp, #7
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 126: return r + Print_println(writefunc);
	ldw	x, (0x05, sp)
	pushw	x
	call	_Print_println
	addw	sp, #2
	addw	x, (0x01, sp)
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 129: size_t Print_println_ib(writefunc_p writefunc, long n, uint8_t base)
;	-----------------------------------------
;	 function Print_println_ib
;	-----------------------------------------
_Print_println_ib:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 133: r = printInt(writefunc, n,base);
	ld	a, (0x0b, sp)
	push	a
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	ldw	x, (0x0a, sp)
	pushw	x
	call	_Print_print_ib
	addw	sp, #7
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 134: return r + Print_println(writefunc);
	ldw	x, (0x05, sp)
	pushw	x
	call	_Print_println
	addw	sp, #2
	addw	x, (0x01, sp)
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 141: size_t Print_println(writefunc_p writefunc)
;	-----------------------------------------
;	 function Print_println
;	-----------------------------------------
_Print_println:
	sub	sp, #2
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 145: n  = writefunc(13);
	push	#0x0d
	ldw	x, (0x06, sp)
	call	(x)
	pop	a
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 146: n += writefunc(10);
	push	#0x0a
	ldw	x, (0x06, sp)
	call	(x)
	pop	a
	addw	x, (0x01, sp)
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 147: return n;
	addw	sp, #2
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 151: size_t Print_print_ub(writefunc_p writefunc, unsigned long n, uint8_t base)
;	-----------------------------------------
;	 function Print_print_ub
;	-----------------------------------------
_Print_print_ub:
	sub	sp, #39
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 154: char *str = &buf[sizeof(buf) - 1];
	ldw	x, sp
	addw	x, #33
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 156: *str = '\0';
	clr	(x)
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 159: if (base < 2) base = 10;
	ld	a, (0x30, sp)
	cp	a, #0x02
	jrnc	00112$
	ld	a, #0x0a
	ld	(0x30, sp), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 161: do {
00112$:
	ldw	(0x26, sp), x
00103$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 162: char c = n % base;
	ld	a, (0x30, sp)
	ld	(0x25, sp), a
	clr	(0x24, sp)
	clr	(0x23, sp)
	clr	(0x22, sp)
	ldw	x, (0x24, sp)
	pushw	x
	ldw	x, (0x24, sp)
	pushw	x
	ldw	x, (0x32, sp)
	pushw	x
	ldw	x, (0x32, sp)
	pushw	x
	call	__modulong
	addw	sp, #8
	ld	a, xl
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 163: n /= base;
	push	a
	ldw	x, (0x25, sp)
	pushw	x
	ldw	x, (0x25, sp)
	pushw	x
	ldw	x, (0x33, sp)
	pushw	x
	ldw	x, (0x33, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	pop	a
	ldw	(0x2e, sp), x
	ldw	(0x2c, sp), y
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 165: *--str = c < 10 ? c + '0' : c + 'A' - 10;
	ldw	x, (0x26, sp)
	decw	x
	ldw	(0x26, sp), x
	ld	xl, a
	cp	a, #0x0a
	jrnc	00108$
	ld	a, xl
	add	a, #0x30
	jra	00109$
00108$:
	ld	a, xl
	add	a, #0x37
00109$:
	ldw	x, (0x26, sp)
	ld	(x), a
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 166: } while(n);
	ldw	x, (0x2e, sp)
	jrne	00103$
	ldw	x, (0x2c, sp)
	jrne	00103$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 168: return Print_print_s(writefunc, str);
	ldw	x, (0x26, sp)
	pushw	x
	ldw	x, (0x2c, sp)
	pushw	x
	call	_Print_print_s
	addw	sp, #43
	ret
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 171: size_t Print_print_ib(writefunc_p writefunc, long n, uint8_t base)
;	-----------------------------------------
;	 function Print_print_ib
;	-----------------------------------------
_Print_print_ib:
	sub	sp, #4
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 173: if (base == 0) {
	tnz	(0x0d, sp)
	jrne	00107$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 174: return writefunc((unsigned char) n);
	ld	a, (0x0c, sp)
	push	a
	ldw	x, (0x08, sp)
	call	(x)
	pop	a
	jra	00109$
00107$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 175: } else if (base == 10) {
	ld	a, (0x0d, sp)
	cp	a, #0x0a
	jrne	00104$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 176: if (n < 0) {
	tnz	(0x09, sp)
	jrpl	00102$
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 177: int t = writefunc('-');
	push	#0x2d
	ldw	x, (0x08, sp)
	call	(x)
	pop	a
	ldw	(0x01, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 178: n = -n;
	ldw	y, (0x0b, sp)
	negw	y
	clr	a
	sbc	a, (0x0a, sp)
	ld	xl, a
	clr	a
	sbc	a, (0x09, sp)
	ld	xh, a
	ldw	(0x0b, sp), y
	ldw	(0x09, sp), x
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 179: return printNumber(writefunc, n, 10) + t;
	push	#0x0a
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	call	_Print_print_ub
	addw	sp, #7
	ldw	y, (0x01, sp)
	ldw	(0x03, sp), y
	addw	x, (0x03, sp)
	jra	00109$
00102$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 181: return printNumber(writefunc, n, 10);
	push	#0x0a
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	call	_Print_print_ub
	addw	sp, #7
	jra	00109$
00104$:
;	C:\Users\sineirx\.platformio\packages\framework-arduinoststm8\cores\sduino\Print.c: 183: return printNumber(writefunc, n, base);
	ld	a, (0x0d, sp)
	push	a
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	call	_Print_print_ub
	addw	sp, #7
00109$:
	addw	sp, #4
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
