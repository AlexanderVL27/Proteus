;
; AssemblerApplication8.asm
;
; Created: 30/05/2023 07:44:24 p. m.
; Author : villa_xaz9a7o
;


; Replace with your application code
ldi r16, 0xff
	out ddrc, r16

	ldi r16, 0x00
	out ddra, r16

	reset:
		ldi r17, 0x00

	loop:
		out portc, r17

		inc r17

		cpi r17, 0xff
		breq reset

		in r20, pina
		delay_loop1:
			ldi r21, 255
			delay_loop2:
				dec r21
				brne delay_loop2
				dec r20
				brne delay_loop1
				rjmp loop

		brne loop
