;
; AssemblerApplication2.asm
;
; Created: 25/05/2023 05:56:40 p. m.
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

otro:         ldi r16,$81
			  out portC,r16
			  ldi r17,80
			  rcall delay

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$81
			  out portC,r16
			  ldi r17, 8
			  rcall delay

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$81
			  out portC,r16
			  ldi r17, 8
			  rcall delay

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$81
			  out portC,r16
			  ldi r17, 8
			  rcall delay

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$81
			  out portC,r16
			  ldi r17, 8
			  rcall delay 

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$81
			  out portC,r16
			  ldi r17, 8
			  rcall delay

			  ldi r16,$82
			  out portC,r16
			  ldi r17,80
			  rcall delay 

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$82
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$82
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$82
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$82
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$80
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$82
			  out portC,r16
			  ldi r17,8
			  rcall delay 

			  ldi r16,$84
			  out portC,r16
			  ldi r17, 30
			  rcall delay 

			  ldi r16,$18
			  out portC,r16
			  ldi r17,80
			  rcall delay

			  ldi r16,$08 
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$18
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$08
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$18
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$08 
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$18
			  out portC,r16
			  ldi r17,8
			  rcall delay 

			  ldi r16,$28
			  out portC,r16
			  ldi r17,80
			  rcall delay

			  ldi r16,$08
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$28
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$08
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$28
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$08
			  out portC,r16
			  ldi r17,8
			  rcall delay

			  ldi r16,$28
			  out portC,r16
			  ldi r17,8
			  rcall delay 

			  ldi r16,$48
			  out portC,r16
			  ldi r17,30
			  rcall delay

			  rjmp otro






delay: 
		ldi r19,0
		out TCCR1A,R19
		ldi r18,4
repite: push r18
		out TIFR,r18
		ldi r18,$3c
		out TCNT1H,r18
		ldi r18,$af
		out TCNT1L,r18
		ldi r18,$1
		out TCCR1B,r18
leer:   in r18,TIFR
		andi r18,$4
		cpi r18,$4
		brne leer
		clr r18
		out TCCR1B,r18
		pop r18
		inc r19
		cp r19,r17
		brlt repite
	ret