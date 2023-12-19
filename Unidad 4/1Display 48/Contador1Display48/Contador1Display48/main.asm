;
; Contador1Display48.asm
;
; Created: 26/05/2022 08:59:28 a. m.
; Author : sergi
;
.org $00
    rjmp inicio

    .org $15
inicio:       ldi r16,$5f 
			  out spl,r16
			  ldi r17,$02
			  out sph,r17

	ldi r16,$0
    out ddra,r16

    ldi r16,$FF
	out ddrc,r16
    out ddrd,r16
	ldi r25,0

I_Decen:	ldi r21,$70

I_Unid:		ldi r16,0

Contador:	out portc,r21
			in r20,pina
			ldi r17,2
			rcall delay


			inc r16
			cp r16,r20
			brne Contador

			inc r21
			cpi r21,$7F ;9		   
			brne unid

			rjmp decen
				

decen:		ldi r21,$70

unid:		ldi r16,0

rjmp Contador


delay: ;ldi r17,@0
		ldi r19,0
		out TCCR1A,R19
		ldi r18,4
repite: push r18
		out TIFR,r18
		ldi r18,$FC
		out TCNT1H,r18
		ldi r18,$17
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