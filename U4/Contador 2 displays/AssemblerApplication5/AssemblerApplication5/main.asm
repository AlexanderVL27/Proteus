;
; Contador2Display48.asm
;
; Created: 26/05/2022 09:07:41 a. m.
; Author : sergi
;
.include "m8535def.inc"
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

I_Inicia:	ldi r24,$E0 

I_Umil:		ldi r23,$D0 

I_Centen:	ldi r22,$B0 

I_Decen:	ldi r21,$70 ;6

I_Unid:		ldi r16,0

Contador:	out portc,r21
			in r20,pina
			ldi r17,0
			rcall delay

			out portc, r22
			ldi r17,0
			rcall delay

			out portc,r23
			ldi r17,0
			rcall delay 

			out portc,r24
			ldi r17,0
			rcall delay


			inc r16
			cp r16,r20
			brne Contador

			inc r21
			cpi r24,$E4        
			brlt unid9
			cpi r23,$DA     
			brlt unid9
			cpi r22,$B5        
			brlt unid9
			cpi r21,$7A	; 8   
			brne unid

			rjmp continuar1

continuar1:	inc r22
			cpi r24,$E2        
			brlt decen9
			cpi r23,$D3        
			brlt decen9
			cpi r22,$B6        
			brne decen

			rjmp continuar2

continuar2:	inc r23		
			cpi r24,$E2       
			brlt centen9
			cpi r23,$D4        
			brne centen

			rjmp continuar3

continuar3:	inc r24
			cpi r24,$E3        
			brne umil	


			rjmp I_Inicia
				
unid9:		cpi r21,$73 ;Derecho
			brne unid

			rjmp continuar1

decen9:		cpi r22,$B2 ;Izquierdo
			brne decen

			rjmp continuar2

centen9:	cpi r23,$DA
			brne centen

			rjmp continuar3

inicia:		ldi r24,$E0

umil:		ldi r23,$D0

centen:		ldi r22,$B0

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