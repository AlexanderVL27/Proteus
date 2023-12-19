;
; AssemblerApplication3.asm
;
; Created: 25/05/2023 06:08:19 p. m.
; Author : villa_xaz9a7o
;


.include "m8535def.inc"
    .org $00
    rjmp inicio

    .org $15
inicio:       ldi r16, $5f
			  out spl,r16
			  ldi r17,$02
			  out sph,r17

			ldi r16,$0
			out ddra,r16
			ldi r16,$FF
			out ddrc,r16
			out ddrd,r16


			

nuevo:   in r24,pina
		 out portc,r24


		 rjmp nuevo